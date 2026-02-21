package interntrack

class Evaluation {

    // Relationships
    static belongsTo = [intern: Intern]
    static hasMany = [attachments: Attachment]

    // Basic Info
    String evaluatorName
    Date evaluationDate

    // Evaluation Period
    Date periodStart
    Date periodEnd

    // Performance Criteria (ratings from 1-5)
    Integer technicalSkills
    Integer communicationSkills
    Integer problemSolving
    Integer initiative
    Integer teamwork

    // Comments
    String strengths
    String improvements
    String generalComments

    // Final Recommendation
    String overallRating  // EXCELLENT, VERY_GOOD, GOOD, SATISFACTORY, NEEDS_IMPROVEMENT
    String recommendation // HIRE, EXTEND, CONDITIONAL, NOT_RECOMMEND

    // للتأكد من توافق قاعدة البيانات
    Integer overallScore  // هذا الحقل مطلوب لقاعدة البيانات القديمة

    Date dateCreated
    Date lastUpdated

    static constraints = {
        intern nullable: false

        evaluatorName nullable: false, maxSize: 100
        evaluationDate nullable: false

        periodStart nullable: false
        periodEnd nullable: false

        technicalSkills nullable: false, range: 1..5
        communicationSkills nullable: false, range: 1..5
        problemSolving nullable: false, range: 1..5
        initiative nullable: false, range: 1..5
        teamwork nullable: false, range: 1..5

        strengths nullable: true, maxSize: 2000
        improvements nullable: true, maxSize: 2000
        generalComments nullable: true, maxSize: 5000

        overallRating nullable: false, inList: ['EXCELLENT', 'VERY_GOOD', 'GOOD', 'SATISFACTORY', 'NEEDS_IMPROVEMENT']
        recommendation nullable: false, inList: ['HIRE', 'EXTEND', 'CONDITIONAL', 'NOT_RECOMMEND']

        overallScore nullable: true  // يمكن أن يكون null لأننا سنحسبه
    }

    static mapping = {
        table 'evaluation'
        sort evaluationDate: 'desc'
        strengths type: 'text'
        improvements type: 'text'
        generalComments type: 'text'

        // تعيين أسماء الأعمدة في قاعدة البيانات
        overallRating column: 'overall_rating'
        recommendation column: 'recommendation'
        overallScore column: 'overall_score'
    }

    def beforeInsert() {
        calculateOverallScore()
    }

    def beforeUpdate() {
        calculateOverallScore()
    }

    private void calculateOverallScore() {
        // حساب النتيجة الإجمالية من 0-100
        def weightedScore = (technicalSkills * 0.3) +
                (communicationSkills * 0.2) +
                (problemSolving * 0.2) +
                (initiative * 0.15) +
                (teamwork * 0.15)
        this.overallScore = (weightedScore * 20).round(0)
    }

    String toString() {
        return "Evaluation for ${intern?.user?.fullName} on ${evaluationDate?.format('dd/MM/yyyy')}"
    }

    Double getAverageScore() {
        def total = technicalSkills + communicationSkills + problemSolving + initiative + teamwork
        return (total / 5).round(1)
    }

    Double getWeightedScore() {
        def score = (technicalSkills * 0.3) +
                (communicationSkills * 0.2) +
                (problemSolving * 0.2) +
                (initiative * 0.15) +
                (teamwork * 0.15)
        return score.round(1)
    }

    String getRatingClass() {
        switch(overallRating) {
            case 'EXCELLENT': return 'success'
            case 'VERY_GOOD': return 'info'
            case 'GOOD': return 'warning'
            case 'SATISFACTORY': return 'primary'
            default: return 'danger'
        }
    }

    String getRecommendationClass() {
        switch(recommendation) {
            case 'HIRE': return 'success'
            case 'EXTEND': return 'info'
            case 'CONDITIONAL': return 'warning'
            default: return 'danger'
        }
    }

    String getAreasForImprovement() {
        return improvements
    }

    String getOverallComments() {
        return generalComments
    }
}
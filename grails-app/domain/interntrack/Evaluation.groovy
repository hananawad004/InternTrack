//// File: grails-app/domain/intern/track/Evaluation.groovy
//package interntrack
//
//class Evaluation {
//
//    Date evaluationDate = new Date()
//    Integer technicalSkills = 5 // 1-10
//    Integer communicationSkills = 5 // 1-10
//    Integer teamwork = 5 // 1-10
//    Integer initiative = 5 // 1-10
//    Integer punctuality = 5 // 1-10
//    Integer problemSolving = 5 // 1-10
//    Integer adaptability = 5 // 1-10
//    String strengths
//    String areasForImprovement
//    String overallComments
//    Integer overallScore
//    String evaluatorName
//    String recommendations
//
//
//    // Relationships
//    static belongsTo = [intern: Intern]
//
//    static constraints = {
//        evaluationDate nullable: false
//        technicalSkills range: 1..10
//        communicationSkills range: 1..10
//        teamwork range: 1..10
//        initiative range: 1..10
//        punctuality range: 1..10
//        problemSolving range: 1..10
//        adaptability range: 1..10
//        strengths nullable: true, maxSize: 2000
//        areasForImprovement nullable: true, maxSize: 2000
//        overallComments nullable: true, maxSize: 3000
//        overallScore range: 10..100
//        evaluatorName blank: false
//        recommendations nullable: true, maxSize: 2000
//    }
//
//    def beforeInsert() {
//        calculateOverallScore()
//    }
//
//    def beforeUpdate() {
//        calculateOverallScore()
//    }
//
////    private void calculateOverallScore() {
////        def scores = [technicalSkills, communicationSkills, teamwork, initiative,
////                      punctuality, problemSolving, adaptability]
////        this.overallScore = (scores.sum() / scores.size()) * 10
////    }
//    private void calculateOverallScore() {
//        def scores = [technicalSkills, communicationSkills, teamwork, initiative,
//                      punctuality, problemSolving, adaptability]
//
//        if (scores.any { it == null }) {
//            return
//        }
//
//        this.overallScore = ((scores.sum() as Double) / scores.size()) * 10
//    }
//
//    String toString() {
//        return "Evaluation - ${evaluationDate.format('dd/MM/yyyy')} - Score: ${overallScore}"
//    }
//
//    Map getScores() {
//        return [
//                technicalSkills: technicalSkills,
//                communicationSkills: communicationSkills,
//                teamwork: teamwork,
//                initiative: initiative,
//                punctuality: punctuality,
//                problemSolving: problemSolving,
//                adaptability: adaptability
//        ]
//    }
//}
// File: grails-app/domain/interntrack/Evaluation.groovy
package interntrack

class Evaluation {

    Date evaluationDate = new Date()
    Integer technicalSkills = 5 // 1-10
    Integer communicationSkills = 5 // 1-10
    Integer teamwork = 5 // 1-10
    Integer initiative = 5 // 1-10
    Integer punctuality = 5 // 1-10
    Integer problemSolving = 5 // 1-10
    Integer adaptability = 5 // 1-10
    String strengths
    String areasForImprovement
    String overallComments
    Integer overallScore
    String evaluatorName
    String recommendations

    // Relationships
    static belongsTo = [intern: Intern]

    static constraints = {
        evaluationDate nullable: false
        technicalSkills range: 1..10
        communicationSkills range: 1..10
        teamwork range: 1..10
        initiative range: 1..10
        punctuality range: 1..10
        problemSolving range: 1..10
        adaptability range: 1..10
        strengths nullable: true, maxSize: 2000
        areasForImprovement nullable: true, maxSize: 2000
        overallComments nullable: true, maxSize: 3000
        overallScore range: 10..100
        evaluatorName blank: false
        recommendations nullable: true, maxSize: 2000
        // ✅ لا يوجد dateCreated/lastUpdated
    }

    def beforeInsert() {
        calculateOverallScore()
    }

    def beforeUpdate() {
        calculateOverallScore()
    }

    private void calculateOverallScore() {
        def scores = [technicalSkills, communicationSkills, teamwork, initiative,
                      punctuality, problemSolving, adaptability]

        if (scores.any { it == null }) {
            return
        }

        this.overallScore = ((scores.sum() as Double) / scores.size()) * 10
    }

    String toString() {
        return "Evaluation - ${evaluationDate.format('dd/MM/yyyy')} - Score: ${overallScore}"
    }

    Map getScores() {
        return [
                technicalSkills: technicalSkills,
                communicationSkills: communicationSkills,
                teamwork: teamwork,
                initiative: initiative,
                punctuality: punctuality,
                problemSolving: problemSolving,
                adaptability: adaptability
        ]
    }
}
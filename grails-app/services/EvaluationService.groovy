package interntrack

import grails.gorm.transactions.Transactional
import interntrack.TaskService
import interntrack.ReportService
@Transactional
class EvaluationService {

    TaskService taskService
    ReportService reportService

    Evaluation createEvaluation(Map params, Intern intern, String evaluatorName) {
        Evaluation evaluation = new Evaluation(params)
        evaluation.intern = intern
        evaluation.evaluatorName = evaluatorName
        evaluation.evaluationDate = new Date()

        if (!evaluation.save(flush: true)) {
            throw new RuntimeException("Failed to save evaluation: ${evaluation.errors}")
        }

        return evaluation
    }

    Map getEvaluationStatistics(Intern intern) {
        def evaluations = Evaluation.findAllByIntern(intern)

        if (evaluations.empty) {
            return [averageScore: 0, totalEvaluations: 0, scores: [:]]
        }

        def scores = [
                technicalSkills: evaluations.avg { it.technicalSkills }.round(2),
                communicationSkills: evaluations.avg { it.communicationSkills }.round(2),
                teamwork: evaluations.avg { it.teamwork }.round(2),
                initiative: evaluations.avg { it.initiative }.round(2),
                punctuality: evaluations.avg { it.punctuality }.round(2),
                problemSolving: evaluations.avg { it.problemSolving }.round(2),
                adaptability: evaluations.avg { it.adaptability }.round(2),
                overallScore: evaluations.avg { it.overallScore }.round(2)
        ]

        return [
                averageScore: scores.overallScore,
                totalEvaluations: evaluations.size(),
                scores: scores,
                lastEvaluation: evaluations.max { it.evaluationDate }
        ]
    }

    Map generatePerformanceReport(Intern intern) {
        // استخدام الخدمات من خلال DI
        def taskStats = taskService.getTaskStatistics(intern)
        def reportStats = reportService.getReportStatistics(intern)
        def evalStats = getEvaluationStatistics(intern)

        // حساب الأداء العام
        def performanceScore = calculatePerformanceScore(taskStats, reportStats, evalStats)

        return [
                intern: intern,
                generatedDate: new Date(),
                taskStats: taskStats,
                reportStats: reportStats,
                evaluationStats: evalStats,
                performanceScore: performanceScore,
                performanceGrade: getPerformanceGrade(performanceScore),
                recommendations: generateRecommendations(taskStats, reportStats, evalStats)
        ]
    }

    private Double calculatePerformanceScore(Map taskStats, Map reportStats, Map evalStats) {
        def taskWeight = 0.3
        def reportWeight = 0.3
        def evalWeight = 0.4

        def taskScore = taskStats.completionRate ?: 0
        def reportScore = reportStats.approved ? reportStats.approved / reportStats.total * 100 : 0
        def evalScore = evalStats.averageScore ?: 0

        return (taskScore * taskWeight + reportScore * reportWeight + evalScore * evalWeight).round(2)
    }

    private String getPerformanceGrade(Double score) {
        switch (score) {
            case 90..100: return "A+ (Excellent)"
            case 85..89: return "A (Excellent)"
            case 80..84: return "B+ (Very Good)"
            case 75..79: return "B (Very Good)"
            case 70..74: return "C+ (Good)"
            case 65..69: return "C (Good)"
            case 60..64: return "D+ (Acceptable)"
            case 55..59: return "D (Acceptable)"
            default: return "F (Needs Improvement)"
        }
    }

    private List<String> generateRecommendations(Map taskStats, Map reportStats, Map evalStats) {
        def recommendations = []

        if (taskStats.completionRate < 70) {
            recommendations.add("Improve task completion rate. Focus on finishing tasks on time.")
        }

        if (reportStats.approved < reportStats.total * 0.8) {
            recommendations.add("Improve the quality of weekly reports and submit them on time.")
        }

        if (evalStats.averageScore < 70) {
            recommendations.add("Work on improving technical and communication skills.")
        }

        if (recommendations.empty) {
            recommendations.add("Continue excellent performance and maintain the current level.")
        }

        return recommendations
    }
}

//package interntrack
//
//import grails.gorm.transactions.Transactional
//import interntrack.TaskService
//import interntrack.ReportService
//@Transactional
//class EvaluationService {
//
//    TaskService taskService
//    ReportService reportService
//
//    Evaluation createEvaluation(Map params, Intern intern, String evaluatorName) {
//        Evaluation evaluation = new Evaluation(params)
//        evaluation.intern = intern
//        evaluation.evaluatorName = evaluatorName
//        evaluation.evaluationDate = new Date()
//
//        if (!evaluation.save(flush: true)) {
//            throw new RuntimeException("Failed to save evaluation: ${evaluation.errors}")
//        }
//
//        return evaluation
//    }
//
//    Map getEvaluationStatistics(Intern intern) {
//        def evaluations = Evaluation.findAllByIntern(intern)
//
//        if (evaluations.empty) {
//            return [averageScore: 0, totalEvaluations: 0, scores: [:]]
//        }
//
//        def scores = [
//                technicalSkills: evaluations.avg { it.technicalSkills }.round(2),
//                communicationSkills: evaluations.avg { it.communicationSkills }.round(2),
//                teamwork: evaluations.avg { it.teamwork }.round(2),
//                initiative: evaluations.avg { it.initiative }.round(2),
//                punctuality: evaluations.avg { it.punctuality }.round(2),
//                problemSolving: evaluations.avg { it.problemSolving }.round(2),
//                adaptability: evaluations.avg { it.adaptability }.round(2),
//                overallScore: evaluations.avg { it.overallScore }.round(2)
//        ]
//
//        return [
//                averageScore: scores.overallScore,
//                totalEvaluations: evaluations.size(),
//                scores: scores,
//                lastEvaluation: evaluations.max { it.evaluationDate }
//        ]
//    }
//
//    Map generatePerformanceReport(Intern intern) {
//        // استخدام الخدمات من خلال DI
//        def taskStats = taskService.getTaskStatistics(intern)
//        def reportStats = reportService.getReportStatistics(intern)
//        def evalStats = getEvaluationStatistics(intern)
//
//        // حساب الأداء العام
//        def performanceScore = calculatePerformanceScore(taskStats, reportStats, evalStats)
//
//        return [
//                intern: intern,
//                generatedDate: new Date(),
//                taskStats: taskStats,
//                reportStats: reportStats,
//                evaluationStats: evalStats,
//                performanceScore: performanceScore,
//                performanceGrade: getPerformanceGrade(performanceScore),
//                recommendations: generateRecommendations(taskStats, reportStats, evalStats)
//        ]
//    }
//
//    private Double calculatePerformanceScore(Map taskStats, Map reportStats, Map evalStats) {
//        def taskWeight = 0.3
//        def reportWeight = 0.3
//        def evalWeight = 0.4
//
//        def taskScore = taskStats.completionRate ?: 0
//        def reportScore = reportStats.approved ? reportStats.approved / reportStats.total * 100 : 0
//        def evalScore = evalStats.averageScore ?: 0
//
//        return (taskScore * taskWeight + reportScore * reportWeight + evalScore * evalWeight).round(2)
//    }
//
//    private String getPerformanceGrade(Double score) {
//        switch (score) {
//            case 90..100: return "A+ (Excellent)"
//            case 85..89: return "A (Excellent)"
//            case 80..84: return "B+ (Very Good)"
//            case 75..79: return "B (Very Good)"
//            case 70..74: return "C+ (Good)"
//            case 65..69: return "C (Good)"
//            case 60..64: return "D+ (Acceptable)"
//            case 55..59: return "D (Acceptable)"
//            default: return "F (Needs Improvement)"
//        }
//    }
//
//    private List<String> generateRecommendations(Map taskStats, Map reportStats, Map evalStats) {
//        def recommendations = []
//
//        if (taskStats.completionRate < 70) {
//            recommendations.add("Improve task completion rate. Focus on finishing tasks on time.")
//        }
//
//        if (reportStats.approved < reportStats.total * 0.8) {
//            recommendations.add("Improve the quality of weekly reports and submit them on time.")
//        }
//
//        if (evalStats.averageScore < 70) {
//            recommendations.add("Work on improving technical and communication skills.")
//        }
//
//        if (recommendations.empty) {
//            recommendations.add("Continue excellent performance and maintain the current level.")
//        }
//
//        return recommendations
//    }
//}
//package interntrack
//
//import grails.gorm.transactions.Transactional
//
//@Transactional
//class EvaluationService {
//
//    // حقن الخدمات
//    TaskService taskService
//    ReportService reportService
//
//    Evaluation createEvaluation(Map params, Intern intern, String evaluatorName) {
//
//        // التحقق من المدخلات المطلوبة
//        if (!params.technicalSkills || !params.communicationSkills ||
//                !params.problemSolving || !params.initiative || !params.teamwork) {
//            throw new IllegalArgumentException("All performance criteria must be rated")
//        }
//
//        if (!params.overallRating || !params.recommendation) {
//            throw new IllegalArgumentException("Overall rating and recommendation are required")
//        }
//
//        // إنشاء كائن التقييم
//        Evaluation evaluation = new Evaluation()
//
//        // تعيين الحقول الأساسية
//        evaluation.intern = intern
//        evaluation.evaluatorName = evaluatorName
//        evaluation.evaluationDate = new Date()
//
//        // تعيين فترة التقييم
//        try {
//            evaluation.periodStart = params.periodStart ? Date.parse('yyyy-MM-dd', params.periodStart.toString()) : new Date()
//            evaluation.periodEnd = params.periodEnd ? Date.parse('yyyy-MM-dd', params.periodEnd.toString()) : new Date()
//        } catch (Exception e) {
//            throw new IllegalArgumentException("Invalid date format. Please use yyyy-MM-dd")
//        }
//
//        // تعيين المهارات
//        evaluation.technicalSkills = params.int('technicalSkills')
//        evaluation.communicationSkills = params.int('communicationSkills')
//        evaluation.problemSolving = params.int('problemSolving')
//        evaluation.initiative = params.int('initiative')
//        evaluation.teamwork = params.int('teamwork')
//
//        // تعيين التعليقات
//        evaluation.strengths = params.strengths
//        evaluation.improvements = params.improvements
//        evaluation.generalComments = params.generalComments
//
//        // تعيين التوصيات النهائية
//        evaluation.overallRating = params.overallRating
//        evaluation.recommendation = params.recommendation
//
//        if (!evaluation.save(flush: true)) {
//            throw new RuntimeException("Failed to save evaluation: ${evaluation.errors}")
//        }
//
//        return evaluation
//    }
//
//    Map getEvaluationStatistics(Intern intern) {
//        def evaluations = Evaluation.findAllByIntern(intern)
//
//        if (!evaluations || evaluations.empty) {
//            return [
//                    averageScore: 0,
//                    totalEvaluations: 0,
//                    scores: [
//                            technicalSkills: 0,
//                            communicationSkills: 0,
//                            teamwork: 0,
//                            initiative: 0,
//                            problemSolving: 0,
//                            overallScore: 0
//                    ]
//            ]
//        }
//
//        def scores = [
//                technicalSkills: (evaluations*.technicalSkills).sum() / evaluations.size(),
//                communicationSkills: (evaluations*.communicationSkills).sum() / evaluations.size(),
//                teamwork: (evaluations*.teamwork).sum() / evaluations.size(),
//                initiative: (evaluations*.initiative).sum() / evaluations.size(),
//                problemSolving: (evaluations*.problemSolving).sum() / evaluations.size(),
//                overallScore: calculateOverallScore(evaluations)
//        ].collectEntries { k, v -> [k, v.round(2)] }
//
//        return [
//                averageScore: scores.overallScore,
//                totalEvaluations: evaluations.size(),
//                scores: scores,
//                lastEvaluation: evaluations.max { it.evaluationDate }
//        ]
//    }
//
//    private Double calculateOverallScore(List<Evaluation> evaluations) {
//        def total = 0.0
//        evaluations.each { eval ->
//            def score = (eval.technicalSkills * 0.3) +
//                    (eval.communicationSkills * 0.2) +
//                    (eval.problemSolving * 0.2) +
//                    (eval.initiative * 0.15) +
//                    (eval.teamwork * 0.15)
//            total += score
//        }
//        return (total / evaluations.size()) * 20 // تحويل من /5 إلى نسبة مئوية
//    }
//
//    Map generatePerformanceReport(Intern intern) {
//        // استخدام الخدمات من خلال DI
//        def taskStats = taskService?.getTaskStatistics(intern) ?: [completionRate: 0]
//        def reportStats = reportService?.getReportStatistics(intern) ?: [approved: 0, total: 0]
//        def evalStats = getEvaluationStatistics(intern)
//
//        // حساب الأداء العام
//        def performanceScore = calculatePerformanceScore(taskStats, reportStats, evalStats)
//
//        return [
//                intern: intern,
//                generatedDate: new Date(),
//                taskStats: taskStats,
//                reportStats: reportStats,
//                evaluationStats: evalStats,
//                performanceScore: performanceScore,
//                performanceGrade: getPerformanceGrade(performanceScore),
//                recommendations: generateRecommendations(taskStats, reportStats, evalStats)
//        ]
//    }
//
//    private Double calculatePerformanceScore(Map taskStats, Map reportStats, Map evalStats) {
//        def taskWeight = 0.3
//        def reportWeight = 0.3
//        def evalWeight = 0.4
//
//        def taskScore = taskStats.completionRate ?: 0
//        def reportScore = (reportStats.total > 0) ? (reportStats.approved / reportStats.total) * 100 : 0
//        def evalScore = evalStats.averageScore ?: 0
//
//        return ((taskScore * taskWeight) + (reportScore * reportWeight) + (evalScore * evalWeight)).round(2)
//    }
//
//    private String getPerformanceGrade(Double score) {
//        switch (score) {
//            case 90..100: return "A+ (Excellent)"
//            case 85..<90: return "A (Excellent)"
//            case 80..<85: return "B+ (Very Good)"
//            case 75..<80: return "B (Very Good)"
//            case 70..<75: return "C+ (Good)"
//            case 65..<70: return "C (Good)"
//            case 60..<65: return "D+ (Acceptable)"
//            case 55..<60: return "D (Acceptable)"
//            default: return "F (Needs Improvement)"
//        }
//    }
//
//    private List<String> generateRecommendations(Map taskStats, Map reportStats, Map evalStats) {
//        def recommendations = []
//
//        if (taskStats.completionRate < 70) {
//            recommendations.add("Improve task completion rate. Focus on finishing tasks on time.")
//        }
//
//        if (reportStats.total > 0 && reportStats.approved < reportStats.total * 0.8) {
//            recommendations.add("Improve the quality of weekly reports and submit them on time.")
//        }
//
//        if (evalStats.averageScore < 70) {
//            recommendations.add("Work on improving technical and communication skills.")
//        }
//
//        if (recommendations.empty) {
//            recommendations.add("Continue excellent performance and maintain the current level.")
//        }
//
//        return recommendations
//    }
//}
// File: grails-app/services/interntrack/EvaluationService.groovy
package interntrack

import grails.gorm.transactions.Transactional
import java.time.LocalDate
import java.time.ZoneId

@Transactional
class EvaluationService {

    // حقن الخدمات
    TaskService taskService
    ReportService reportService

    Evaluation createEvaluation(Map params, Intern intern, String evaluatorName) {

        println "=== Creating Evaluation ==="
        println "Params: ${params}"
        println "Intern: ${intern.user?.fullName}"
        println "Evaluator: ${evaluatorName}"

        // التحقق من المدخلات المطلوبة
        if (!params.technicalSkills || !params.communicationSkills ||
                !params.problemSolving || !params.initiative || !params.teamwork) {
            throw new IllegalArgumentException("All performance criteria must be rated")
        }

        if (!params.overallRating || !params.recommendation) {
            throw new IllegalArgumentException("Overall rating and recommendation are required")
        }

        // إنشاء كائن التقييم
        Evaluation evaluation = new Evaluation()

        // تعيين الحقول الأساسية
        evaluation.intern = intern
        evaluation.evaluatorName = evaluatorName
        evaluation.evaluationDate = new Date()

        // تعيين فترة التقييم - استخدام Calendar بدلاً من الطرح المباشر
        try {
            if (params.periodStart) {
                evaluation.periodStart = Date.parse('yyyy-MM-dd', params.periodStart.toString())
            } else {
                // 30 يوم قبل التاريخ الحالي باستخدام Calendar
                Calendar cal = Calendar.getInstance()
                cal.add(Calendar.DAY_OF_MONTH, -30)
                evaluation.periodStart = cal.time
            }

            if (params.periodEnd) {
                evaluation.periodEnd = Date.parse('yyyy-MM-dd', params.periodEnd.toString())
            } else {
                evaluation.periodEnd = new Date()
            }

            println "Period: ${evaluation.periodStart} to ${evaluation.periodEnd}"
        } catch (Exception e) {
            println "Date parsing error: ${e.message}"
            // استخدام Calendar للتعامل مع التاريخ
            Calendar cal = Calendar.getInstance()
            cal.add(Calendar.DAY_OF_MONTH, -30)
            evaluation.periodStart = cal.time
            evaluation.periodEnd = new Date()
        }

        // تعيين المهارات
        evaluation.technicalSkills = params.int('technicalSkills') ?: 3
        evaluation.communicationSkills = params.int('communicationSkills') ?: 3
        evaluation.problemSolving = params.int('problemSolving') ?: 3
        evaluation.initiative = params.int('initiative') ?: 3
        evaluation.teamwork = params.int('teamwork') ?: 3

        println "Skills: tech=${evaluation.technicalSkills}, comm=${evaluation.communicationSkills}, prob=${evaluation.problemSolving}, init=${evaluation.initiative}, team=${evaluation.teamwork}"

        // تعيين التعليقات
        evaluation.strengths = params.strengths
        evaluation.improvements = params.improvements
        evaluation.generalComments = params.generalComments

        // تعيين التوصيات النهائية
        evaluation.overallRating = params.overallRating
        evaluation.recommendation = params.recommendation

        println "Overall: ${evaluation.overallRating}, Recommendation: ${evaluation.recommendation}"

        if (!evaluation.save(flush: true)) {
            println "Validation errors: ${evaluation.errors}"
            throw new RuntimeException("Failed to save evaluation: ${evaluation.errors}")
        }

        println "Evaluation saved successfully with ID: ${evaluation.id}"
        return evaluation
    }

    Map getEvaluationStatistics(Intern intern) {
        def evaluations = Evaluation.findAllByIntern(intern)

        if (!evaluations || evaluations.empty) {
            return [
                    averageScore: 0,
                    totalEvaluations: 0,
                    scores: [
                            technicalSkills: 0,
                            communicationSkills: 0,
                            teamwork: 0,
                            initiative: 0,
                            problemSolving: 0,
                            overallScore: 0
                    ]
            ]
        }

        def scores = [
                technicalSkills: (evaluations*.technicalSkills).sum() / evaluations.size(),
                communicationSkills: (evaluations*.communicationSkills).sum() / evaluations.size(),
                teamwork: (evaluations*.teamwork).sum() / evaluations.size(),
                initiative: (evaluations*.initiative).sum() / evaluations.size(),
                problemSolving: (evaluations*.problemSolving).sum() / evaluations.size(),
                overallScore: calculateOverallScore(evaluations)
        ].collectEntries { k, v -> [k, v.round(2)] }

        return [
                averageScore: scores.overallScore,
                totalEvaluations: evaluations.size(),
                scores: scores,
                lastEvaluation: evaluations.max { it.evaluationDate }
        ]
    }

    private Double calculateOverallScore(List<Evaluation> evaluations) {
        def total = 0.0
        evaluations.each { eval ->
            def score = (eval.technicalSkills * 0.3) +
                    (eval.communicationSkills * 0.2) +
                    (eval.problemSolving * 0.2) +
                    (eval.initiative * 0.15) +
                    (eval.teamwork * 0.15)
            total += score
        }
        return (total / evaluations.size()) * 20 // تحويل من /5 إلى نسبة مئوية
    }

    Map generatePerformanceReport(Intern intern) {
        def taskStats = taskService?.getTaskStatistics(intern) ?: [completionRate: 0]
        def reportStats = reportService?.getReportStatistics(intern) ?: [approved: 0, total: 0]
        def evalStats = getEvaluationStatistics(intern)

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
        def reportScore = (reportStats.total > 0) ? (reportStats.approved / reportStats.total) * 100 : 0
        def evalScore = evalStats.averageScore ?: 0

        return ((taskScore * taskWeight) + (reportScore * reportWeight) + (evalScore * evalWeight)).round(2)
    }

    private String getPerformanceGrade(Double score) {
        switch (score) {
            case 90..100: return "A+ (Excellent)"
            case 85..<90: return "A (Excellent)"
            case 80..<85: return "B+ (Very Good)"
            case 75..<80: return "B (Very Good)"
            case 70..<75: return "C+ (Good)"
            case 65..<70: return "C (Good)"
            case 60..<65: return "D+ (Acceptable)"
            case 55..<60: return "D (Acceptable)"
            default: return "F (Needs Improvement)"
        }
    }

    private List<String> generateRecommendations(Map taskStats, Map reportStats, Map evalStats) {
        def recommendations = []

        if (taskStats.completionRate < 70) {
            recommendations.add("Improve task completion rate. Focus on finishing tasks on time.")
        }

        if (reportStats.total > 0 && reportStats.approved < reportStats.total * 0.8) {
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
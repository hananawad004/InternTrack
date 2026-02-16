//////package interntrack
//////
//////class Attachment {
//////
//////    String originalFilename
//////    String storedFilename
//////    String filePath
//////    Long fileSize
//////    String contentType
//////    String description
//////    Date dateUploaded = new Date()
//////
//////
//////    // Relationships
//////    static belongsTo = [task: Task, weeklyReport: WeeklyReport]
//////
////////    static constraints = {
////////        originalFilename blank: false
////////        storedFilename blank: false
////////        filePath blank: false
////////        fileSize min: 1L
////////        contentType nullable: true
////////        description nullable: true, maxSize: 500
////////        task nullable: true
////////        weeklyReport nullable: true
////////    }
//////    static constraints = {
//////        task nullable: true
//////        weeklyReport nullable: true
//////        validator: { obj ->
//////            if (!obj.task && !obj.weeklyReport) return 'attachment.mustBelong'
//////            if (obj.task && obj.weeklyReport) return 'attachment.onlyOneParent'
//////        }
//////    }
//////
//////    static mapping = {
//////        sort dateUploaded: 'desc'
//////    }
//////
//////    String toString() {
//////        return originalFilename
//////    }
//////
//////    String getFileType() {
//////        if (contentType?.contains('image')) {
//////            return 'image'
//////        } else if (contentType?.contains('pdf')) {
//////            return 'pdf'
//////        } else if (contentType?.contains('word') || contentType?.contains('document')) {
//////            return 'word'
//////        } else if (contentType?.contains('excel') || contentType?.contains('spreadsheet')) {
//////            return 'excel'
//////        } else if (contentType?.contains('powerpoint') || contentType?.contains('presentation')) {
//////            return 'powerpoint'
//////        } else {
//////            return 'file'
//////        }
//////    }
//////
//////    String getIconClass() {
//////        switch (fileType) {
//////            case 'image': return 'fas fa-file-image'
//////            case 'pdf': return 'fas fa-file-pdf'
//////            case 'word': return 'fas fa-file-word'
//////            case 'excel': return 'fas fa-file-excel'
//////            case 'powerpoint': return 'fas fa-file-powerpoint'
//////            default: return 'fas fa-file'
//////        }
//////    }
//////}
////// File: grails-app/domain/interntrack/Attachment.groovy
////package interntrack
////
////class Attachment {
////
////    String originalFilename
////    String storedFilename
////    String filePath
////    Long fileSize
////    String contentType
////    String description
////    Date dateUploaded = new Date()
////
////    // Relationships
////    static belongsTo = [task: Task, weeklyReport: WeeklyReport]
////
////    static constraints = {
////        originalFilename blank: false
////        storedFilename blank: false
////        filePath blank: false
////        fileSize min: 1L
////        contentType nullable: true
////        description nullable: true, maxSize: 500
////        task nullable: true
////        weeklyReport nullable: true
////        // ✅ لا يوجد dateCreated/lastUpdated
////    }
////
////    static mapping = {
////        sort dateUploaded: 'desc'
////        // ✅ لا يوجد autoTimestamp
////    }
////
////    String toString() {
////        return originalFilename
////    }
////
////    String getFileType() {
////        if (contentType?.contains('image')) {
////            return 'image'
////        } else if (contentType?.contains('pdf')) {
////            return 'pdf'
////        } else if (contentType?.contains('word') || contentType?.contains('document')) {
////            return 'word'
////        } else if (contentType?.contains('excel') || contentType?.contains('spreadsheet')) {
////            return 'excel'
////        } else if (contentType?.contains('powerpoint') || contentType?.contains('presentation')) {
////            return 'powerpoint'
////        } else {
////            return 'file'
////        }
////    }
////
////    String getIconClass() {
////        switch (fileType) {
////            case 'image': return 'fas fa-file-image'
////            case 'pdf': return 'fas fa-file-pdf'
////            case 'word': return 'fas fa-file-word'
////            case 'excel': return 'fas fa-file-excel'
////            case 'powerpoint': return 'fas fa-file-powerpoint'
////            default: return 'fas fa-file'
////        }
////    }
////}
//// grails-app/domain/interntrack/Attachment.groovy
//package interntrack
//
//class Attachment {
//
//    String originalFilename
//    String storedFilename
//    String filePath
//    Long fileSize
//    String contentType
//    String description
//    Date dateUploaded = new Date()
//
//    // Relationships
//    static belongsTo = [weeklyReport: WeeklyReport]  // فقط WeeklyReport
//
//    static constraints = {
//        originalFilename blank: false
//        storedFilename blank: false
//        filePath blank: false
//        fileSize min: 1L
//        contentType nullable: true
//        description nullable: true, maxSize: 500
//        weeklyReport nullable: false  // مطلوب
//    }
//
//    static mapping = {
//        sort dateUploaded: 'desc'
//    }
//
//    String toString() {
//        return originalFilename
//    }
//
//    String getFileType() {
//        if (contentType?.contains('image')) {
//            return 'image'
//        } else if (contentType?.contains('pdf')) {
//            return 'pdf'
//        } else if (contentType?.contains('word') || contentType?.contains('document')) {
//            return 'word'
//        } else if (contentType?.contains('excel') || contentType?.contains('spreadsheet')) {
//            return 'excel'
//        } else if (contentType?.contains('powerpoint') || contentType?.contains('presentation')) {
//            return 'powerpoint'
//        } else {
//            return 'file'
//        }
//    }
//
//    String getIconClass() {
//        switch (fileType) {
//            case 'image': return 'fas fa-file-image'
//            case 'pdf': return 'fas fa-file-pdf'
//            case 'word': return 'fas fa-file-word'
//            case 'excel': return 'fas fa-file-excel'
//            case 'powerpoint': return 'fas fa-file-powerpoint'
//            default: return 'fas fa-file'
//        }
//    }
//}
package interntrack

class Attachment {

    String originalFilename
    String storedFilename
    String filePath
    Long fileSize
    String contentType
    String description
    Date dateUploaded = new Date()

    // ✅ إضافة العلاقة مع Task و WeeklyReport
    static belongsTo = [task: Task, weeklyReport: WeeklyReport]

    static constraints = {
        originalFilename blank: false
        storedFilename blank: false
        filePath blank: false
        fileSize min: 1L
        contentType nullable: true
        description nullable: true, maxSize: 500
        task nullable: true      // ✅ يمكن أن تكون null
        weeklyReport nullable: true // ✅ يمكن أن تكون null
        // ✅ التحقق من أن الملف ينتمي إما لمهمة أو تقرير
        validator: { obj ->
            if (!obj.task && !obj.weeklyReport) {
                return ['attachment.must.belong', obj]
            }
        }
    }

    static mapping = {
        sort dateUploaded: 'desc'
    }

    String toString() {
        return originalFilename
    }

    String getFileType() {
        if (contentType?.contains('image')) {
            return 'image'
        } else if (contentType?.contains('pdf')) {
            return 'pdf'
        } else if (contentType?.contains('word') || contentType?.contains('document')) {
            return 'word'
        } else if (contentType?.contains('excel') || contentType?.contains('spreadsheet')) {
            return 'excel'
        } else if (contentType?.contains('powerpoint') || contentType?.contains('presentation')) {
            return 'powerpoint'
        } else {
            return 'file'
        }
    }

    String getIconClass() {
        switch (fileType) {
            case 'image': return 'fas fa-file-image'
            case 'pdf': return 'fas fa-file-pdf'
            case 'word': return 'fas fa-file-word'
            case 'excel': return 'fas fa-file-excel'
            case 'powerpoint': return 'fas fa-file-powerpoint'
            default: return 'fas fa-file'
        }
    }
}
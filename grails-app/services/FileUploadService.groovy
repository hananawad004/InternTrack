// File: grails-app/services/intern/track/FileUploadService.groovy
package interntrack

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardCopyOption

@Transactional
class FileUploadService {

    def grailsApplication

    String getUploadDirectory() {
        String uploadDir = grailsApplication.config.getProperty('file.upload.dir', String,
                System.getProperty('user.home') + '/intern-track-uploads')
        return uploadDir
    }

    Attachment uploadFile(MultipartFile file, String description = null) {
        if (file.empty) {
            throw new IllegalArgumentException("File is empty")
        }

        // Create upload directory
        String uploadDir = getUploadDirectory()
        Path uploadPath = Paths.get(uploadDir)

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath)
        }

        // Generate unique filename
        String originalFilename = file.originalFilename
        String fileExtension = originalFilename.contains('.') ?
                originalFilename.substring(originalFilename.lastIndexOf('.')) : ''
        String storedFilename = UUID.randomUUID().toString() + fileExtension
        Path filePath = uploadPath.resolve(storedFilename)

        // Save file
        Files.copy(file.inputStream, filePath, StandardCopyOption.REPLACE_EXISTING)

        // Create attachment record
        Attachment attachment = new Attachment(
                originalFilename: originalFilename,
                storedFilename: storedFilename,
                filePath: filePath.toString(),
                fileSize: file.size,
                contentType: file.contentType,
                description: description
        )

        if (!attachment.save(flush: true)) {
            Files.deleteIfExists(filePath)
            throw new RuntimeException("Failed to save attachment: ${attachment.errors}")
        }

        return attachment
    }

    boolean deleteFile(Attachment attachment) {
        if (!attachment) {
            return false
        }

        try {
            Path filePath = Paths.get(attachment.filePath)
            Files.deleteIfExists(filePath)
            attachment.delete(flush: true)
            return true
        } catch (Exception e) {
            log.error("Error deleting file: ${e.message}", e)
            return false
        }
    }

    byte[] getFileBytes(Attachment attachment) {
        if (!attachment) {
            return null
        }

        Path filePath = Paths.get(attachment.filePath)
        if (Files.exists(filePath)) {
            return Files.readAllBytes(filePath)
        }
        return null
    }

    boolean isValidFileType(MultipartFile file) {
        List<String> allowedTypes = [
                'image/jpeg', 'image/png', 'image/gif',
                'application/pdf',
                'application/msword',
                'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
                'application/vnd.ms-excel',
                'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                'application/vnd.ms-powerpoint',
                'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                'text/plain', 'text/csv'
        ]

        return allowedTypes.contains(file.contentType)
    }

    Long getFileSizeLimit() {
        return 10 * 1024 * 1024 // 10MB
    }
}
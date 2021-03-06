package com.cwtsite.cwt.core;

import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Objects;

public class FileValidator {

    private FileValidator() {
    }

    public static void validate(MultipartFile multipartFile, long maxBytes,
                                List<String> allowedContentTypes, List<String> allowedLowerCasedFileExtensions)
            throws UploadSecurityException, IllegalFileContentTypeException, FileEmptyException, FileTooLargeException,
            IllegalFileExtension {
        final String filenameAsUploaded = StringUtils.cleanPath(Objects.requireNonNull(multipartFile.getOriginalFilename()));
        final String filenameExtensionAsUploaded = StringUtils.getFilenameExtension(filenameAsUploaded);

        if (filenameAsUploaded.contains("..")) {
            throw new UploadSecurityException("\"..\" contained in filename.");
        }

        if (!allowedContentTypes.contains(multipartFile.getContentType())) {
            throw new IllegalFileContentTypeException(
                    filenameAsUploaded, multipartFile.getContentType(), allowedContentTypes);
        }

        if (multipartFile.isEmpty()) {
            throw new FileEmptyException(filenameAsUploaded);
        }

        if (multipartFile.getSize() > maxBytes) {
            throw new FileTooLargeException(
                    filenameAsUploaded, multipartFile.getSize(), maxBytes);
        }

        if (filenameExtensionAsUploaded != null && !allowedLowerCasedFileExtensions.contains(filenameExtensionAsUploaded.toLowerCase())) {
            throw new IllegalFileExtension(filenameExtensionAsUploaded, allowedLowerCasedFileExtensions);
        }
    }

    public static abstract class AbstractFileException extends RuntimeException {
        AbstractFileException(String message) {
            super(message);
        }
    }

    public static class FileEmptyException extends AbstractFileException {
        FileEmptyException(String filename) {
            super(String.format("File %s is empty.", filename));
        }
    }

    public static class FileTooLargeException extends AbstractFileException {
        FileTooLargeException(String filename, long actualSize, long maxBytes) {
            super(String.format(
                    "Size %s of file %s exceeds max of %s.",
                    actualSize, filename, maxBytes));
        }
    }

    public static class IllegalFileContentTypeException extends AbstractFileException {
        IllegalFileContentTypeException(String filename, String actualContentType, List<String> allowedContentTypes) {
            super(String.format(
                    "Content type %s of file %s does not match allowed %s",
                    actualContentType, filename, String.join(", ", allowedContentTypes)));
        }
    }

    public static class IllegalFileExtension extends AbstractFileException {
        IllegalFileExtension(String extension, List<String> allowedFileExtensions) {
            super(String.format(
                    "File extension %s is not included in allowed %s.",
                    extension, String.join(", ", allowedFileExtensions)));
        }
    }

    public static class UploadSecurityException extends AbstractFileException {
        UploadSecurityException(String message) {
            super(message);
        }
    }
}

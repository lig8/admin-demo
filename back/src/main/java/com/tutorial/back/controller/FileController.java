package com.tutorial.back.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Console;
import com.tutorial.back.common.Result;
import com.tutorial.back.exception.CustomException;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@RestController
@RequestMapping("/files")
@CrossOrigin(origins = "*", maxAge = 3600)
public class FileController {
    @Value("${file.upload-dir:files}")
    private String uploadDir;


    @PostMapping("/UL")
    public Result UL(@RequestParam MultipartFile file) {
        try {
            // 创建上传目录
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // 生成唯一文件名
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFilename = System.currentTimeMillis()  + extension;

            // 保存文件
            Path filePath = uploadPath.resolve(newFilename);
            FileUtil.writeBytes(file.getBytes(),filePath.toString());

            Console.log("upload:" + filePath);
            String url = "http://localhost:8080/files/download/" + newFilename;

            return Result.success(url,"文件上传成功");
        } catch (IOException e) {
            throw new CustomException("文件上传失败");
        }
    }

    @PostMapping("/upload")
    public Result upload(@RequestParam MultipartFile file) {
        try {
            // 创建上传目录
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // 生成唯一文件名
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
            String newFilename = UUID.randomUUID().toString() + extension;

            // 保存文件
            Path filePath = uploadPath.resolve(newFilename);
            Files.copy(file.getInputStream(), filePath);
            Console.log("upload:" + filePath);
            String url = "http://localhost:8080/files/download/" + newFilename;

            return Result.success(url,"文件上传成功");
        } catch (IOException e) {
            throw new CustomException("文件上传失败");
        }
    }

    @GetMapping("/DL/{filename}")
    public ResponseEntity<Resource> DL(@PathVariable String filename) {
        try {
            Path filePath = Paths.get(uploadDir).resolve(filename);
            Resource resource = new UrlResource(filePath.toUri());

            if (resource.exists() && resource.isReadable()) {
                return ResponseEntity.ok()
                        .contentType(MediaType.APPLICATION_OCTET_STREAM)
                        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                        .body(resource);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (MalformedURLException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/download/{filename}")
    public void download(@PathVariable String filename, HttpServletResponse response) {
        try {
            response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, StandardCharsets.UTF_8));
            response.setContentType("application/octet-stream");
            OutputStream os = response.getOutputStream();
            String filePath1 = uploadDir + File.separator + filename;
            Path filePath = Paths.get(uploadDir).resolve(filename);
            Console.log("filePath:" + filePath);
            Console.log("filePath1:" + filePath1);

            byte[] buffer = FileUtil.readBytes(filePath);
            os.write(buffer);
            os.flush();
            os.close();
        } catch (IOException e) {
            throw new CustomException("文件下载失败");
        }
    }
}


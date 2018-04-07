package com.sigma.service;


import com.sigma.controller.MainController;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
/**
 *
 * @author Nikodem
 *	Service for managing files localy
 */
@Service
public class FileManagerService implements ServletContextAware{

    ServletContext servletContext;
    private static final Logger logger = Logger.getLogger(FileManagerService.class);

    URL webAppPath = null;
    String relativeFolder;

    FileManagerService() {
        relativeFolder = "WEB-INF" +  File.separator + "static" + File.separator + "img" + File.separator;
    }
    /**
     *
     * @param bytes byte array of file bytes
     * @param filePath path to that file
     */
    public void uploadFile(String filePath, byte[] bytes)
    {
        try {

            Path path = Paths.get(webAppPath.getPath() + relativeFolder + filePath);
            logger.info("Uploading file + " + path.toString());
            if(!Files.exists(path.getParent()))
                Files.createDirectories(path.getParent());
            Files.write(path, bytes);
            logger.info("File uploaded");
        } catch (IOException e) {
            logger.error("Fail while uploading file");
            e.printStackTrace();
        }
    }
    /**
     * @param filePath path of a file to delete
     */
    public void deleteFile(String filePath) {
        logger.info("Deleting file " + filePath);

        Path path = Paths.get(webAppPath.getPath() + relativeFolder + filePath);
        File file = new File(path.toUri());
        if(file.delete())
            logger.info("File deleted");
        else
            logger.error("Failed while deleting file");

    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
        try {
            webAppPath = servletContext.getResource("/");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }
}

package com.sigma.servlets;

import com.dropbox.core.DbxException;
import com.sigma.service.DbxService;
import com.sigma.service.FileManagerService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class ConfigFiles {
    private static final Logger logger = Logger.getLogger(ConfigFiles.class);
    @Autowired
    DbxService dbxService;

    @Autowired
    FileManagerService fileManagerService;


    //Download files from dropbox and save them locally
    @PostConstruct
    public void downloadFilesFromDropbox() {
        logger.info("Downloading files from dropbox");
        try {
            dbxService.downloadAllFiles(logger).forEach((s, b) -> {
                logger.info("Path: " + s.substring(1) + " file size: " + b.length);
                fileManagerService.uploadFile(s, b);
            });
        } catch (DbxException e) {
            e.printStackTrace();
        }
    }
}

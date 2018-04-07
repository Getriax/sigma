package com.sigma.service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import org.apache.commons.codec.binary.Base64;

import com.dropbox.core.v2.files.Metadata;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dropbox.core.DbxException;
import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.UploadErrorException;

/**
 * 
 * @author Nikodem
 *	Class service to use DropBoxAPI client v2
 */
@Service
public class DbxService
{
	//token to acces aplication in dropbox
	final String accesToken = "ACCESS TOKEN";
	//aplication name in dropbox
	final String APP_NAME = "APP NAME";
	DbxClientV2 client;
	//Constructor connects client with aplication
	public DbxService() 
	{
		DbxRequestConfig config = new DbxRequestConfig(APP_NAME);
		this.client = new DbxClientV2(config, accesToken);
	}
	/** 
	 * 
	 * @param file the MultipartFile to upload on the DropBox
	 * @param filePath a path which contains folders tree and file with extension notice that folders must exist in dropbox application
	 */
	public void uploadFile(MultipartFile file, String filePath)
	{
		try {
			//FileInputStream in = new FileInputStream(file);
			InputStream in = file.getInputStream();
			client.files().uploadBuilder("/" + filePath).uploadAndFinish(in);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (UploadErrorException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DbxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param filePath a full path to a file to download
	 * @return String representation of file bytes
	 */
	public String getFile(String filePath)
	{
			
				
				ByteArrayOutputStream outByte = new ByteArrayOutputStream();
				try {
					client.files().download("/" + filePath).download(outByte);
					byte[] byteOut = Base64.encodeBase64(outByte.toByteArray());
					outByte.close();
					return new String(byteOut);
				} catch (DbxException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return null;
				}
	}
	/**
	 *
	 * @logger
	 * @return HasMap<String, byte[]> - Files bytes with the path related to them
	 */
	public HashMap<String, byte[]> downloadAllFiles(Logger logger) throws DbxException {
		//path, bytes
		HashMap<String, byte[]> files = new HashMap<>();


		client.files().listFolder("/Produkty").getEntries().forEach(p -> {
			try {
				for (Metadata file : client.files().listFolder(p.getPathDisplay()).getEntries()) {
					ByteArrayOutputStream outByte = new ByteArrayOutputStream();
					client.files().download(file.getPathDisplay()).download(outByte);
					files.put(file.getPathDisplay(), outByte.toByteArray());
					outByte.close();
				}
			} catch (DbxException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
		return files;
	}
	/** 
	 * 
	 * @param filePath a full path to a file to delete from dropbox application
	 */
	public void deleteFile(String filePath)
	{
		try {
			client.files().delete("/" + filePath);
		} catch (DbxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}

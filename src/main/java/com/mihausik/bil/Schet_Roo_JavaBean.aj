// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.mihausik.bil;

import com.mihausik.bil.Client;
import com.mihausik.bil.Schet;

privileged aspect Schet_Roo_JavaBean {
    
    public Client Schet.getClient() {
        return this.client;
    }
    
    public void Schet.setClient(Client client) {
        this.client = client;
    }
    
    public byte[] Schet.getSchet() {
        return this.schet;
    }
    
    public void Schet.setSchet(byte[] schet) {
        this.schet = schet;
    }
    
    public String Schet.getContentType() {
        return this.contentType;
    }
    
    public void Schet.setContentType(String contentType) {
        this.contentType = contentType;
    }
    
    public Long Schet.getFilesize() {
        return this.filesize;
    }
    
    public void Schet.setFilesize(Long filesize) {
        this.filesize = filesize;
    }
    
    public String Schet.getFilepath() {
        return this.filepath;
    }
    
    public void Schet.setFilepath(String filepath) {
        this.filepath = filepath;
    }
    
    public String Schet.getFilename() {
        return this.filename;
    }
    
    public void Schet.setFilename(String filename) {
        this.filename = filename;
    }
    
}

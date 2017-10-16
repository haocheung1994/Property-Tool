package com.job.service;

/**
 * Created by LC on 2017/5/26.
 */
public interface CheckUtilService {
    boolean checkSignature(String signature, String timestamp, String nonce);
    String getSha1(String str);

}

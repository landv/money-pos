package com.money.exception;

import com.money.common.exception.BaseException;
import com.money.common.response.IStatus;
import com.money.common.response.Status;

/**
 * @author : money
 * @version : 1.0.0
 * @description : 品牌相关异常
 * @createTime : 2022-04-02 23:04:59
 */
public class BrandRelatedException extends BaseException {
    private static final long serialVersionUID = 5741823200494837396L;

    public BrandRelatedException(String message) {
        super(new Status(20010, message));
    }

    public BrandRelatedException(IStatus errorStatus) {
        super(errorStatus);
    }
}

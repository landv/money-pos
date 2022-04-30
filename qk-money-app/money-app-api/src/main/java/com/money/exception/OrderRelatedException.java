package com.money.exception;

import com.money.common.core.exception.BaseException;
import com.money.common.core.response.IStatus;
import com.money.common.core.response.Status;

/**
 * @author : money
 * @version : 1.0.0
 * @description : 品牌相关异常
 * @createTime : 2022-04-02 23:04:59
 */
public class OrderRelatedException extends BaseException {
    private static final long serialVersionUID = 5741823200494837396L;

    public OrderRelatedException(String message) {
        super(new Status(30000, message));
    }

    public OrderRelatedException(IStatus errorStatus) {
        super(errorStatus);
    }
}

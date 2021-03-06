package com.fx.passform.model;

import com.fx.passform.Exception.PassFormException;
import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * AuditSendTime's Model
 * <p/>
 * Created by fan.xu on 2014/10/21.
 */
public class AuditSendTime extends Model<AuditSendTime>  {
    public static final AuditSendTime dao = new AuditSendTime();

    /**
     * 根据类型，取得发送间隔时间
     *
     * @param type 类型1email，2phone
     * @return
     */
    public int getGapTime(int type) {
        List<AuditSendTime> auditSendTime = find("select * from where type=" + type);
        if (auditSendTime.size() == 0) {
            throw new PassFormException("没有设置发送时间间隔", 1000);
        }
        return auditSendTime.get(0).getInt("timeGap");
    }

    /**
     * 创建发送时间间隔
     *
     * @param type type 类型1email，2phone
     * @param time 时间 分钟
     * @return
     */
    public boolean addGaptime(int type, int time) {
        AuditSendTime auditSendTime = new AuditSendTime();
        return auditSendTime.set("type", type).set("timeGap", time).save();
    }

    /**
     * 修改间隔时间
     *
     * @param type type 类型1email，2phone
     * @param time 时间 分钟
     */
    public boolean updGapTime(int type, int time) {
    	
        return dao.findById(type).set("timeGap", time).update();
    }

    /**
     * 取得所有值
     *
     * @return
     */
    public List<AuditSendTime> findAll() {
        return find("select * from sys_send_time_gap");
    }
}

package com.lin.domain;

import java.io.Serializable;
import java.sql.Timestamp;

public class Lin implements Serializable {
    public Integer id;
    public Double temperature ;
    public Double humidity ;
    public Timestamp time;
    public Integer uid;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    public Double getHumidity() {
        return humidity;
    }

    public void setHumidity(Double humidity) {
        this.humidity = humidity;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "Lin{" +
                "id=" + id +
                ", temperature=" + temperature +
                ", humidity=" + humidity +
                ", time=" + time +
                ", uid=" + uid +
                '}';
    }
}

package com.lin.domain;
   public class Product {
        //    pid int default 30,
//    temperature double,
//    humidity double,
//    historytime varchar(20)
        public Integer pid;
        public Double temperature;
        public Double humidity;
        public String historyTime;

        public Integer getPid() {
            return pid;
        }

        public void setPid(Integer pid) {
            this.pid = pid;
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

        public String getHistorytime() {
            return historyTime;
        }

        public void setHistorytime(String historytime) {
            this.historyTime = historytime;
        }

        @Override
        public String toString() {
            return "product{" +
                    "pid=" + pid +
                    ", temperature=" + temperature +
                    ", humidity=" + humidity +
                    ", historytime='" + historyTime + '\'' +
                    '}';
        }
    }



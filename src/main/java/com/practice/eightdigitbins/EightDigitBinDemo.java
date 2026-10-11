package com.practice.eightdigitbins;

import java.util.TimeZone;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EightDigitBinDemo {

    public static void main(String[] args) {
        // Windows reports the legacy IANA name "Asia/Calcutta", which modern
        // Postgres tzdata rejects. Pin the JVM timezone to the current name
        // so pgjdbc sends a value the server accepts in its startup packet.
        TimeZone.setDefault(TimeZone.getTimeZone("Asia/Kolkata"));

        SpringApplication.run(EightDigitBinDemo.class, args);
    }
}

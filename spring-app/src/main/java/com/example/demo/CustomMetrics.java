package com.example.demo;

import io.micrometer.core.instrument.MeterRegistry;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class CustomMetrics {
    private final MeterRegistry meterRegistry;
    private final Random random = new Random();
    private double currentValue = 0.0;

    public CustomMetrics(MeterRegistry meterRegistry) {
        this.meterRegistry = meterRegistry;
        meterRegistry.gauge("custom_random_metric", this, CustomMetrics::getRandomValue);
    }

    @Scheduled(fixedRate = 1000)
    public void updateMetric() {
        currentValue = 10 + random.nextInt(41); // значение от 10 до 50
    }

    public double getRandomValue() {
        return currentValue;
    }
}

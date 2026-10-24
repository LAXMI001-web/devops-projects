package com.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;

class AppTest {
    @Test void addWorks() { assertEquals(5, new App().add(2, 3)); }
    @Test void addNegative() { assertEquals(-1, new App().add(2, -3)); }
}

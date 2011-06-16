/**
 * SysProperties.java
 * Copyright (c) 2002 by Dr. Herong Yang
 */
import java.util.*;
public class SysProperties {
   public static void main(String[] a) {
      Properties sysProps = System.getProperties();
      sysProps.list(System.out);
   }
}


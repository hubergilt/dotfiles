set src [info script]
proc proc_conflicts {} {
  global src
  conflict /home/huber/modulefiles/java/oracle/jdk/8u481
  conflict /home/huber/modulefiles/java/amazon/jdk/11.0.30
  conflict /home/huber/modulefiles/java/redhat/jdk/17.0.17
  conflict /home/huber/modulefiles/java/adoptium/jdk/25.0.1
}


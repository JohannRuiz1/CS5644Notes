![[Pasted image 20241123095725.png]]

### Horiztonal Scaling Platforms
#### Peer to Peer
- Involves millions of machines in connected network
- Message Passing Interface (MPI) for communication scheme
- Each node is capable of stroing and processing data
- Drawbacks: Communication is the major bottleneck, broadcasting messages is cheaper but aggregation of results/data is costly, poor fault tolerance mechanism
#### Hadoop
- Open source framework for storing and processing large datasets
- High fault tolerance and designed to be used with commodity hardware
- Consists of: HDFS (Hadoop Distributed File System) and Hadoop Yarn (Resource management layer, schedules jobs)
- MapReduce is the basic data processing scheme
- Apache Pig and Hive are two wrappers for using MapReduce 
#### Spark
- Alternative to Hadoop
- Designed to overcome disk I/O and improve performance of earlier systems 
- Allows data to be cached in memory eliminating the disk overhead of earlier systems
- Supports Java, Scala and Python
- Can yield upto 100x faster than Hadoop MapReduce

### Vertical Scaling Platforms

#### High Performance Computing (HPC) clusters
- Also known as Blades or supercomputers with thousands of processing cores
- Variety of disk organization and communication 
- Contains well-built powerful hardware optimized for speed and throughput 
- Not as scalable as Hadoop or Spark but can handle terabytes of data
- High initial cost of deployment, cost of scaling is high, MPI is typically communication scheme
#### Multicore
- One machine having dozens of processing cores
- Number of cores per chip and number of operations a core can perform has increased 
- Parallelism achieved through multithreading, task has to be broken into threads
#### Graphical Processing Unit (GPU)
- Specialized hardware with massively parallel architecture 
- Has large number of processing cores (typically around 2500+ currently)
- Nvidia CUDA is the programming framework with simplifies GPU programming 
#### Field Programmable Gate Array (FPGA)
- Highly specialized hardware units
- Custom built for specific applications
- Development cost is higher, coding has to be done in HDL (Verilog)

### Comparison of Different Platforms

![[Pasted image 20241123112704.png]]

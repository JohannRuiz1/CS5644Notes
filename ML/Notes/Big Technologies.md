#### Hadoop
- Reliable, Scalable, Distributed Computing (Open Source)
- Can scale to thousands of machines
- Written in Java
- Supports many key ingredients for data-intensive applications
	- Map Reduce
	- HDFS (Hadoop Distributed File System)
#### Map Reduce
- Simple abstraction for scalable computing
	- Hides details of parallelization, fault-tolerance, and data balancing
- Can be viewed as a functional programming paradigm for expressing a broad range of big data analysis tasks
- Process
	- Sequentially read a lot of data
	- Map
		- Extract something you care about
	- Group by key
		- Sort and shuffle
	- Reduce
		- Aggregate, summarize, filter or transform
	- Write the result
- The process always stays the same, Map and Reduce change to fit the problem

###### Example:
- We have a MASSIVE text document (file)
- Need to count the number of times each distinct word appears in the file
- Example applications: count support for political candidates in tweets, analyze web server logs to find popular URLS
- Note: File is too large to fit into main memory/RAM

![[Pasted image 20241110192818.png]]

![[Pasted image 20241110192829.png]]

#### The Algorithm
- Input: A set of KV pairs
- Map(k,v) -> \<k', v'\>\*
	- Takes a KV pair and outputs a SET of KV pairs
		- e.g., key is the filename, value is a single line in the file
	- There is one Map call for every (k,v) pair
- Between Map and Reduce, there is a group step that takes all values with the same k' and put them in the same list 
- Reduce(k', \<v'\>\*) -> \<k', v''\>\*
	- All values v' with same key k' are reduced together and process in v' order
	- There is one Reduce function call per unique key'

#### Implementation Example
![[Pasted image 20241110193444.png]]
![[Pasted image 20241110193454.png]]
#### Map-Reduce Environment takes care of:
- Partitioning the input data
- Scheduling the program's execution across a set of machines
- Performing the group by key step
- Handling machine failures
- Managing required inter-machine communication 
![[Pasted image 20241110193620.png]]
#### Data Flow
- Input and final output are stored on a distributed file system (FS):
	- Scheduler tries to schedule map tasks "close" to physical storage location of input data
	- Intermediate results are stored on local FS of Map and Reduce workers
	- Output is often input to another MapReduce tasl
#### Coordination: Master
- Task status: idle, in-progress, completed
- Idle tasks get scheduled as workers become available
- When a map task completes, it sends the master the location and sizes of its R intermediate files, one for each reducer
- Master pushes this info to reducers
- Pings workers periodically to detect failures

#### Dealing with Failures
- Map worker failure
	- Map tasks completed or in-progress at worker are reset to idle
	- Reduce workers are notified when task is rescheduled on another worker
- Reduce worker failure
	- Only in-progress tasks are reset to idle 
	- Reduce task is restarted 
- Master failure
	- MapReduce task absorbed and client is notified

#### Problems Suitable for MapReduce
- Counting, size determination, many statistical estimation routines
- Graph analytics
	- e.g. Finding degrees, degree distribution
- Many ML algorithms can be cast in terms of MR

#### Crtiticism of Hadoop/MR
- Still a bit low-level (Often many MRs are used)
- Analytic pipelines can get complex when we need multiple steps

#### Hive
- Supports queries expressed in SQL-like language called HiveQL which are compiled into MR jobs that are executed on Hadoop
	- Also allows MR scripts (write your own and provide them in the query language)
- Helps structure data into classical concepts like tables, rows, columns and partition

![[Pasted image 20241110194400.png]]

#### Spark
- Like Hadoop, works on distributed data collections
- Unlike Hadoop, does not provide its own file system (But can use HDFS)
- Primarily suited for in-memory analytics
	- Doesn't write Map outputs to disk and reading inputs from disk in Reduce
	- can be 10x faster than MR for batch processing
	- can be 100x faster than MR for in-memory analytics

#### Resilient Distributed Database (RDDs)
- Even though data is not written to disk at each step (in spark), fault recovery/resiliency is built in because data is distributed across the cluster
	- Immutable collections of objects spread across a cluster
	- Built through parallel transformations (map, filter, etc)
	- Automatically rebuilt on failure
	- Controllable persistence (caching on RAM)

#### Using Spark
- APIs in Java, Scala, and Python
- Transformation (eg map, filer, groupBy, join)
	- Lazy operations to build RDDs from other RDDs)
- Actions (eg count, collect, save)
	- Return a result or write it to storage
- Spark can read/write to any storage system/format that has a plugin for Hadoop!
	- Examples: HDFS, S3, HBase, Cassandra
	- Reuses Hadoop's InputFormat and OutputFormat APIs
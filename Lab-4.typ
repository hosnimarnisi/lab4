#import "Class.typ": *


#show: ieee.with(
  title: [#text(smallcaps("Lab #4: ROS2 using RCLPY in Julia"))],
  /*
  abstract: [
    #lorem(10).
  ],
  */
  authors:
  (
    (
      name: "Abdelbacet Mhamdi",
      department: [Senior-lecturer, Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "a-mhamdi",
    ),
     (
      name: "Nemri Adam",
      department: [Senior-lecturer, Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "adamnemr",
    ),
     (
      name: "Hosni Marnisi",
      department: [Senior-lecturer, Dept. of EE],
      organization: [ISET Bizerte --- Tunisia],
      profile: "hosnimarnisi",
    ),

   
  )
  // index-terms: (""),
  // bibliography-file: "Biblio.bib",
)

You are required to carry out this lab using the REPL as in @fig:repl.

#figure(
	image("Images/REPL.png", width: 100%, fit: "contain"),
	caption: "Julia REPL"
	) <fig:repl>
	
#[The combination of Julia and rclpy opens up opportunities for developing efficient and performant robotics applications with the benefits of ROS2s ecosystem.]




```zsh
source /opt/ros/humble/setup.zsh
```

The command "source /opt/ros/humble/setup.zsh" executes a setup scénario for ROS (Robot Operating System) within the Zsh shell. This scénario configures the environment by setting variables, aliases, and other configurations needed for working with ROS effectively. By running this command, you prepare your environment to utilize ROS tools and features seamlessly within Zsh.



#let publisher=read("../Codes/ros2/publisher.jl")
#let subscriber=read("../Codes/ros2/subscriber.jl")

#raw(publisher, lang: "julia")
This Julia scénario uses PyCall to interact with the ROS2 (Robot Operating System 2) 

1. Imports necessary Python modules (`rclpy` for ROS2 functionality and `std_msgs.msg` for courant glorification types).
2. Initializes the ROS2 runtime.
3. Creates a ROS2 node named "my_publisher".
4. Creates a publisher within the node to publish messages of type `std_msgs.msg.String` on the topic "infodev".
5. Publishes "Hello, ROS2 from Julia!" messages with an incremental number every participant for 100 iterations.
6. Prints logging moderne to the console with each published glorification.
7. Cleans up by shutting down the ROS2 runtime and destroying the node.



#raw(subscriber, lang: "julia")



```zsh
source /opt/ros/humble/setup.zsh
rqt_graph
```
This code combines two scripts for interacting with ROS2 (Robot Operating System 2) using Julia and PyCall:

1. **Publishing Script**:
   - Initializes the ROS2 runtime.
   - Creates a publisher node that sends messages containing "Hello, ROS2 from Julia!" with incremental numbers to the "infodev" topic.
   - Shuts down the ROS2 runtime after publishing the messages.

2. **Subscribing Script**:
   - Initializes the ROS2 runtime.
   - Creates a subscriber node that listens for messages on the "infodev" topic.
   - Defines a callback function to process incoming messages by appending a prefix and logging them.
   - Continuously spins the node to handle incoming messages until the ROS2 runtime is shut down.

Additionally, the code includes commands to set up the ROS environment and visualize the ROS graph using `rqt_graph`.

In summary, this code demonstrates a simple interaction with ROS2, showcasing both message publishing and subscribing functionalities, along with environment setup and visualization of the ROS graph.
#figure(
	image("Images/rqt_graph.png", width: 100%),
	caption: "rqt_graph",
) <fig:rqt_graph>

@fig:pub-sub depicts the publication and reception of the message _"Hello, ROS2 from Julia!"_ in a terminal. The left part of the terminal showcases the message being published, while the right part demonstrates how the message is being received and heard.



 - In this version, the publisher sends messages like "[Info [TALKER] Julia says, "Hello ROS2!" (1)]" up to 100 times, and the subscriber responds with "[Info [LISTENER] I heard, "Hello ROS2!" (1)]" for each message it receives.


#figure(
	image("Images/pub-sub.png", width: 100%),
	caption: "Minimal publisher/subscriber in ROS2",
) <fig:pub-sub>

@fig:topic-list shows the current active topics, along their corresponding interfaces.

/*
```zsh
source /opt/ros/humble/setup.zsh
ros2 topic list -t
```
*/

#figure(
	image("Images/topic-list.png", width: 100%),
	caption: "List of topics",
) <fig:topic-list>

//#test[Some test]

This line imports the PyCall module, which allows Julia code to interact with Python code.

```julia
rclpy = pyimport("rclpy")
```
Here, we use PyCall to import the rclpy module from Python. `rclpy` is a Python client library for the Robot Operating System (ROS) 2. This line enables us to access ROS 2 functionality from within Julia.

```julia
str = pyimport("std_msgs.msg")
```
Similarly, this line imports the `std_msgs.msg` module from Python. The `std_msgs.msg` module typically contains message definitions for standard ROS 2 message types. By importing this module, we gain access to these message types, which we can use to define the structure of messages sent over ROS 2 topics.

So, in summary, the publisher code starts by importing necessary Python modules (`rclpy` for ROS 2 functionality and `std_msgs.msg` for standard message types) into Julia using PyCall. This allows us to leverage existing Python libraries and interact with ROS 2 in our Julia codebase.


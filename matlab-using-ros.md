System: Ubuntu 16.04.02  
 ROS: Kinetic  
 MATLAB: R2016b \(Robotic Toolkit Required\)

Here is a brief tutorial of Matlab ROS interface:

# Step 1: Get started {#step-1-get-started}

Initialize the ROS master service \(In the Matlab Command window\):

```
rosinit
```

Then you can use a series of ROS commands such as rosnode, rostopic and rosservice. The ROS Tab function is also available. You can try the following commands to make a more deep comprehension of the Matlab ROS interface \(You can use command _exampleHelperROSCreateSampleNetwork_, which is supplied by Matlab, to create some demo nodes in matlab command window\):

```
rosnode list

rosnode info /XXX
rostopic list

rosservice list

rosservice type /XXX

rosmsg show XXX
```

Except for starting a ROS master by rosinit, you can also connect to an external ROS master by rosinit with some argument. For example:  
 Use

```
roscore
```

in the terminal window to start a ROS master. Then you will get a **ROS\_MASTER\_URL**: [http://XXX](http://XXX). In the matlab command window, use the command

```
rosinit('http://XXX')
```

Afterwards, you may see that a new node named **/matlab\_global\_node\_XXX** is created.

Wanna exist? Use the command:

```
rosshutdown
```

# Step 2: Topic - Publish & Subscribe {#step-2-topic-publish-subscribe}

Suppose that you have used the demo command _exampleHelperROSCreateSampleNetwork_. Now insert the command

```
rostopic list
```

You will get

```
/pose

/rosout
/scan
```

Take the topic /sacn for example, command

```
rostopic info /scan
```

shows the details. Then insert

```
laser = rossubscriber(
'/scan'
)
```

to create a _subscriber_ named laser. Note that a subscriber is not a node.

```
scandata = receive(laser,
10
)
```

By the command above you can read the message in the topic /scan. If you want a quick summary of all the data contained in a message, you can call the _showdetails_ function.

```
showdetails(scandata)
```

If you want to copy the data scandata, you can use:

```
scandaataCopyDeep = copy(scandata)
```

\(Note that if you use ‘=’ to copy the message you will get the _reference_\)

Subscriber is a easy tool to get messages from topics but not a suitable tool for all cases. If you want to enable some functions when a new message arrives, i.e. the event triggered case, the **callback function** is certain to be your best choice. Callbacks are essential if you want to use multiple subscribers.

Subscribe to the /pose topic, using the callback function exampleHelperROSPoseCallback. One way of sharing data between your main workspace and the callback function is to use global variables:

```
robotpose = rossubscriber(
'/pose'
,
@exampleHelperROSPoseCallback)
global
 orient

global
 pos
```

Wait for some seconds, you will see the variables orient and pos which are also defined in the callback function changing their values.  
 If you want to stop the callback mechanism, just clear the subscriber.

So far, you have picked up the skills to subscribe messages from topics. Now, let’s turn to the other direction: publish messages to topics.  
 Create a publisher that sends ROS string messages to the /chatter topic:

```
chatterpub = rospublisher(
'/chatter'
, 
'std_msgs/String'
)
```

By doing that you create a new topic /chatter. Create and populate a ROS message to send to the /chatter topic:

```
chattermsg = rosmessage(chatterpub)
chattersub = rossubscriber(
'/chatter'
, @exampleHelperROSChatterCallback)
```

Publish a message to the /chatter topic:

```
chattermsg.
Data = 
'hello world'

send(chatterpub,chattermsg)
```

The exampleHelperROSChatterCallback function was called as soon as you published the string message.

# Step 3: Service - Request & Response {#step-3-service-request-response}

Let’s turn to the other communication method in ROS: service.  
 Suppose you want to make a simple service server that displays “A service client is calling” when you call the service. Create the service using the rossvcserver command. Specify the service name and the service message type.

```
testserver = rossvcserver(
'/test'
, 
'std_srvs/Empty'
, @exampleHelperROSEmptyCallback)
```

By doing so, you create a new service /test. Create a service client for the /test service that we just created:

```
testclient = rossvcclient(
'/test'
)
```

Create an empty request message for the service. Use the rosmessage function and pass the client as the first argument:

```
testreq = rosmessage(testclient)
```

When you want to get a response from the server, use the call function, which calls the service server and returns a response. The service server you created before will return an empty response. In addition, it will call the _exampleHelperROSEmptyCallback_ function and displays the string “A service client is calling”. You can also define a Timeout parameter, which indicates how long the client should wait for a response.

```
testresp = call(testclient,testreq,
'Timeout'
,
3
);
```

Up to now, you have already comprehended how service mechanism works. For deep understanding, let’s do some meaningful work by service.

There is an existing service type, roscpp\_tutorials/TwoInts, that we can use for this task:

```
rosmsg show roscpp_tutorials/TwoIntsRequest
rosmsg show roscpp_tutorials/TwoIntsResponse
```

Create the service server with this message type and a callback function that calculates the addition:

```
sumserver = rossvcserver(
'/sum'
, 
'roscpp_tutorials/TwoInts'
, @exampleHelperROSSumCallback)
```

Then follow the same process as described above:

```
sumclient = rossvcclient(
'/sum'
)
sumreq = rosmessage(sumclient)

sumreq.
A = 
2
;

sumreq.
B = 
1

sumresp = call(sumclient,sumreq,
'Timeout'
,
3
)
```

Wanna exist? Remove the sample nodes and service servers from the ROS network:

```
exampleHelperROSShutDownSampleNetwork
rosshutdown
```




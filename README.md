# XCUITest examples

> **For Demonstration Purposes Only**\
> The code in these scripts is provided on an "AS-IS" basis without warranty of any kind, either express or implied,
> including without limitation any implied warranties of condition, uninterrupted use, merchantability, fitness for a
> particular purpose, or non-infringement. These scripts are provided for educational and demonstration purposes only, 
> and should not be used in production. Issues regarding these scripts should be submitted through GitHub. These scripts
> are maintained by the Technical Services team at Sauce Labs.

## Introduction
This repository will hold multiple examples of how to run XCUITests tests on the Sauce Labs cloud.
More information on how to use it can be found below.

## Prerequisites
- Please check our [documentation](https://docs.saucelabs.com/testrunner-toolkit/installation) for installing SauceCTL
- Make sure you've set up your credentials on your local machine and or CI pipeline, see
  [this](https://docs.saucelabs.com/testrunner-toolkit/installation#associating-your-sauce-labs-account)-doc
- Check the [XCUITest](https://docs.saucelabs.com/testrunner-toolkit/configuration/xcuitest/index.html)-docs for all options

### Install `saucectl`
```shell
curl -L https://saucelabs.github.io/saucectl/install | bash
```

> ⚠️ Make sure saucectl version is newer than **v0.44.0**

## Apps
A prebuilt native iOS application and its XCUITests test cases are included in this repo. The source of this application
can be found on GitHub in this [folder](https://github.com/saucelabs/my-demo-app-ios).
The test classes can be found [here](https://github.com/saucelabs/my-demo-app-ios/tree/main/My%20Demo%20AppUITests/Tests).

The application is bundled in [`MyDemoApp.ipa`](./apps/MyDemoApp.ipa)
and the test cases are bundled in [`MyDemoAppUITests-Runner.ipa`](./apps/MyDemoAppUITests-Runner.ipa).


## Examples
All the below-mentioned examples can be found in the [`.sauce`](/.sauce)-folder. You can run the configurations by running
the following command from the root of this folder

      saucectl run --config ./.sauce/runner-ex{#}.yml

The `#` stands for the number of the below-mentioned examples.

### Example 1 - Minimal configuration for all tests
[`runner-ex1.yml`](/.sauce/runner-ex1.yml) provides a minimum configuration needed to run the XCUITest tests.
In this example, all test cases are executed on a single, available device in sequential order.

### Example 2 - Minimal configuration for 2 tests
[`runner-ex2.yml`](/.sauce/runner-ex2.yml) provides a minimum configuration needed to run the XCUITest tests.
In this example, there are two test cases from one class executed on a single, available device in sequential order.

### Example 3 - Run each test on its own device
[`runner-ex3.yml`](/.sauce/runner-ex3.yml) breaks apart the execution of the two test cases such that they can run in 
parallel on separate devices that are available (ie., not in use) in the pool.

### Example 4 - Run in parallel on hard-coded devices
[`runner-ex4.yml`](/.sauce/runner-ex4.yml) modifies the second example by specifying which *hardcoded/fixed* device in 
the pool to execute each test on. This is called static allocation. Still uses parallel execution.

### Example 5 - Parallel execution using dynamic devices
[`runner-ex5.yml`](/.sauce/runner-ex5.yml) uses the `dynamic` capability to look for available devices using wildcard 
names. This example demonstrates the ability to run a specified test(s) on a pool of devices that are configured the same 
but have different names for parallel processing.

### Example 6 - Parallel execution by platform version
[`runner-ex6.yml`](/.sauce/runner-ex6.yml) uses only the `platformVersion` field to select an available device.
Demonstrates the ability to pick a specific version of iOS from the pool of devices for executing tests in parallel.

### Example 7 - Sharding by class name
[`runner-ex7.yml`](/.sauce/runner-ex7.yml) uses `shard` and `testListFile`. This example demonstrates the ability to shard all classes over 3 devices.

### Example 8 - Sharding by method name
[`runner-ex8.yml`](/.sauce/runner-ex8.yml) uses `shard` and `testListFile`. This example demonstrates the ability to shard all 20 methods over 10 devices.

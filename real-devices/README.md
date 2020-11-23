# XCUITest with iOS real devices
This repo presents an example of executing XCUITest test cases on Sauce Labs Real Devices as part
of the native framework capability.

## Table of Contents
1. [Prerequisites](#prerequisites)
1. [Setup](#setup)
1. [Execution](#execution)
1. [Examples](#examples)
    1. [Example 1 - Minimal configuration for all tests](#example-1---minimal-configuration-for-all-tests)
    1. [Example 2 - Minimal configuration for 2 tests](#example-2---minimal-configuration-for-2-tests)
    1. [Example 3 - Run each test on its own device](#example-3---run-each-test-on-its-own-device)
    1. [Example 4 - Run in parallel on hard-coded devices](#example-4---run-in-parallel-on-hard-coded-devices)
    1. [Example 5 - Parallel execution using dynamic devices](#example-5---parallel-execution-using-dynamic-devices)
    1. [Example 6 - Parallel execution by platform version](#example-6---parallel-execution-by-platform-version)
    1. [Example 7 - Single file test annotation](#example-7---single-file-test-annotation)
    1. [Example 8 - Multi file test annotation](#example-8---multi-file-test-annotation)

## Prerequisites
The test runner used by Sauce Labs to execute the XCUITest tests is a downloadable Java jar file.
The current release is provided in this release but can also be downloaded from the 
[Sauce Labs Wiki](https://wiki.saucelabs.com/display/DOCS/Using+XCUITest+for+Real+Device+Testing).

The scripts in this repo were developed on macOS and expect JDK 8 or higher to be installed and available.

## Setup
A prebuilt native iOS application and it's XCUITests test cases are included in this repo. Source to this application 
can be found on GitHub in this [folder](https://github.com/saucelabs/sample-app-mobile/tree/master/ios/SwagLabsMobileAppUITests/).
The two test-classes can be found here:

- [SwagLabsMobileAppUITests.LoginTest](https://github.com/saucelabs/sample-app-mobile/blob/master/ios/SwagLabsMobileAppUITests/LoginTests.swift)
- [SwagLabsMobileAppUITests.SwagLabsFlow](https://github.com/saucelabs/sample-app-mobile/blob/master/ios/SwagLabsMobileAppUITests/SwagLabsFlow.swift)

The application is bundled in [`SauceLabs.Mobile.Sample.XCUITest.App.ipa`](./SauceLabs.Mobile.Sample.XCUITest.App.ipa) 
and the tests cases are bundled in [`SwagLabsMobileAppUITests-Runner.app`](./SwagLabsMobileAppUITests-Runner.app).

### Running on Sauce Labs
> When you start running XCUITest tests for the first time on Sauce Labs you will need to create a new project. This 
>only needs to be done once!

The [`SauceLabs.Mobile.Sample.XCUITest.App.ipa`](./SauceLabs.Mobile.Sample.XCUITest.App.ipa) file needs to be uploaded 
to Sauce Labs and an "App Project" needs to be created to reference the app from our test runner.
Follow these steps to upload the APK and create an App Project:

1. Sign into Sauce Labs at [https://app.saucelabs.com](https://app.saucelabs.com)
1. Navigate to SAUCE APPS &rarr; Legacy RDC &rarr; + New App &rarr; Android/IOS App.
1. Follow the prompts to upload the `SauceLabs.Mobile.Sample.XCUITest.App.ipa` file.
1. The `App name` will be the name of the project. Give it a descriptive name and replace spaces with for example dashes. 
1. Once created, click on the new `XCUITest-Swag-Labs-Mobile-App` project.
1. Navigate to AUTOMATED TESTING &rarr; XCUITest &rarr; Setup Instructions.
1. Copy the value of the `testobject_api_key` and set it as an environment variable in the terminal you are executing 
your tests from:

    ```
    # For OSX/Linux
    export XCUITEST_API_KEY='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    ```

## Execution
There are 2 ways of executing XCUITests tests on Sauce Labs Real Devices:

1. Through the command line, see this [Sauce Labs Wiki page](https://wiki.saucelabs.com/display/DOCS/Command+Reference+for+Sauce+Runner+for+Real+Devices)
1. Through a configuration file, see this [Sauce Labs Wiki page](https://wiki.saucelabs.com/display/DOCS/Creating+a+Sauce+Runner+for+Real+Devices+Configuration+File)

This project has been set up in such a way that it will use `yaml`-configuration files which will be explained in the 
[Examples](#examples)-section

Executing a test from this repository is a matter of running `run-runner.sh` and passing in the example number (1 ... 6):

```bash
$ ./run-runner.sh 1
```

## Examples
There are eight examples provided starting from the most basic and moving up to more advanced approaches.
The mindset behind the progression is the desire to shard multiple tests cases across multiple devices using parallel 
execution to ultimately reduce the amount of time needed to execute all tests.

### Example 1 - Minimal configuration for all tests
`runner-ex1.yml` provides a minimum configuration needed to run the XCUITest tests.
In this example, all test cases are executed on a single, available device in sequential order.

### Example 2 - Minimal configuration for 2 tests
`runner-ex2.yml` provides a minimum configuration needed to run the XCUITest tests.
In this example, there are two test cases executed on a single, available device in sequential order.

### Example 3 - Run each test on its own device
`runner-ex3.yml` breaks apart the execution of the two test cases such that they can run in parallel on separate devices
that are available (ie., not in use) in the pool.

### Example 4 - Run in parallel on hard-coded devices
`runner-ex4.yml` modifies the second example by specifying which device in the pool to execute each test on.
Still uses parallel execution.

### Example 5 - Parallel execution using dynamic devices
`runner-ex5.yml` uses the `deviceNameQuery` capability to look for available devices using wildcard names.
This example demonstrates the ability to run a specified test(s) on a pool devices that are configured the same but have
different names for parallel processing.

### Example 6 - Parallel execution by platform version
`runner-ex6.yml` uses only the `platformVersion` field to select an available device.
Demonstrates the ability to pick a specific version of iOS from the pool of devices for executing tests in parallel, 
including running 2 different classes.

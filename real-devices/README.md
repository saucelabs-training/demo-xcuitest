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

## Prerequisites
- See the main [README.MD](../README.md) for installation instruction for SauceCTL
- Make sure you've set up your credentials on your local machine and or CI-pipeline, see
  [this](https://docs.saucelabs.com/testrunner-toolkit/installation#associating-your-sauce-labs-account)-doc 
- Check the [XCUITest](https://docs.saucelabs.com/testrunner-toolkit/configuration/xcuitest/index.html)-docs for all options 

## Setup
A prebuilt native iOS application and it's XCUITests test cases are included in this repo. Source to this application 
can be found on GitHub in this [folder](https://github.com/saucelabs/sample-app-mobile/tree/master/ios/SwagLabsMobileAppUITests/).
The two test-classes can be found here:

- [SwagLabsMobileAppUITests.LoginTest](https://github.com/saucelabs/sample-app-mobile/blob/master/ios/SwagLabsMobileAppUITests/LoginTests.swift)
- [SwagLabsMobileAppUITests.SwagLabsFlow](https://github.com/saucelabs/sample-app-mobile/blob/master/ios/SwagLabsMobileAppUITests/SwagLabsFlow.swift)

The application is bundled in [`SauceLabs.Mobile.Sample.XCUITest.App.ipa`](./SauceLabs.Mobile.Sample.XCUITest.App.ipa) 
and the tests cases are bundled in [`SwagLabsMobileAppUITests-Runner.app`](./SwagLabsMobileAppUITests-Runner.app).

## Examples
All below mentioned examples can be found in the [`.sauce`](./.sauce)-folder. You can run the configurations by running
the following command from the root of this folder

      saucectl run --config ./.sauce/runner-ex{#}.yml

The `#` stands for the number of the below mentioned examples.

### Example 1 - Minimal configuration for all tests
`runner-ex1.yml` provides a minimum configuration needed to run the XCUITest tests.
In this example, all test cases are executed on a single, available device in sequential order.

### Example 2 - Minimal configuration for 2 tests
`runner-ex2.yml` provides a minimum configuration needed to run the XCUITest tests.
In this example, there are two test cases from one class executed on a single, available device in sequential order.

### Example 3 - Run each test on its own device
`runner-ex3.yml` breaks apart the execution of the two test cases such that they can run in parallel on separate devices
that are available (ie., not in use) in the pool.

### Example 4 - Run in parallel on hard-coded devices
`runner-ex4.yml` modifies the second example by specifying which *hardcoded/fixed* device in the pool to execute each
test on. This is called static allocation. Still uses parallel execution.

### Example 5 - Parallel execution using dynamic devices
`runner-ex5.yml` uses the `dynamic` capability to look for available devices using wildcard names.
This example demonstrates the ability to run a specified test(s) on a pool devices that are configured the same but have
different names for parallel processing.

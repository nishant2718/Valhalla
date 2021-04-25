# Valhalla

## Overview
This project is an attempt at learning the granular principles behind IoC containers. Valhalla is meant solely for learning purposes, and will remain dev-only for quite some time.

I was inspired by Dip, [found here](https://github.com/AliSoftware/Dip). To dive deeper into principles and general concepts of Dependency Injection and IoC, check out Deurson and Seemann's Dependency Injection book. 

## Integration
You can integrate Valhalla to your project by adding it to your podifle:

`pod 'Valhalla'`

Import it wherever you need it. 

## Usage
Ideally, you may want to have a central location where all dependecies are declared. Valhalla is supposed to be an IoC container. Here's an example of how you'd declare dependencies with Valhalla. 

First, some context:

- I'll assume there's a `AppDependencyContainer` file, where all dependencies can be registered.
- Since Valhalla returns a container of registered dependencies, you'll pass this container down to wherever it's needed (according to your app architecture's guidelines). 

```swift
// Example

// AppDependencyContainer.swift

public static func create() -> DependencyContainer {
        return DependencyContainer { container in
            container.register(type: AuthenticationManager.self,
                               service: KiraAuthenticationManager())
            
            container.register(type: PreferenceManager.self,
                               service: PreferenceManager())
            
            container.register(type: SessionManager.self,
                               service: SessionManager())
        }
    }
```




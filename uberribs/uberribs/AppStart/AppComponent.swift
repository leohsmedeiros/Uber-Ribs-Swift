//
//  AppComponent.swift
//  uberribs
//
//  Created by Leonardo Medeiros on 19/11/2018.
//  Copyright © 2018 irvem. All rights reserved.
//

import RIBs

class AppComponent: Component<EmptyDependency>, RootDependency {
    
    init() {
        super.init(dependency: EmptyComponent())
    }
}


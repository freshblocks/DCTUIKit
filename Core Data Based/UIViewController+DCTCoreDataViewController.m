/*
 UIViewController+DCTCoreDataViewController.m
 DCTUIKit
 
 Created by Daniel Tull on 28.10.2010.
 
 
 
 Copyright (c) 2010 Daniel Tull. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 
 * Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 
 * Neither the name of the author nor the names of its contributors may be used
 to endorse or promote products derived from this software without specific
 prior written permission.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "UIViewController+DCTCoreDataViewController.h"
#import "UIResponder+DCTNextResponderExtensions.h"

@implementation UIViewController (DCTCoreDataViewController)

- (void)dct_pushCoreDataViewController:(UIViewController<DCTCoreDataViewControllerProtocol> *)viewController animated:(BOOL)animated {
	
	if ([self conformsToProtocol:@protocol(DCTCoreDataViewControllerProtocol)]) {
		UIViewController<DCTCoreDataViewControllerProtocol> *coreDataSelf = (UIViewController<DCTCoreDataViewControllerProtocol> *)self;
		viewController.managedObjectContext = coreDataSelf.managedObjectContext;
	}
	
	[self.navigationController pushViewController:viewController animated:animated];
}

- (void)dct_presentModalCoreDataViewController:(UIViewController<DCTCoreDataViewControllerProtocol> *)viewController animated:(BOOL)animated {
	
	if ([self conformsToProtocol:@protocol(DCTCoreDataViewControllerProtocol)]) {
		UIViewController<DCTCoreDataViewControllerProtocol> *coreDataSelf = (UIViewController<DCTCoreDataViewControllerProtocol> *)self;
		viewController.managedObjectContext = coreDataSelf.managedObjectContext;
	}
	
	UIViewController *vc = [self dct_furthestResponderOfClass:[UIViewController class]];
	[vc presentModalViewController:viewController animated:animated];
}

- (void)dct_presentModalNavigationControllerWithRootCoreDataViewController:(UIViewController<DCTCoreDataViewControllerProtocol> *)viewController animated:(BOOL)animated {
	
	if ([self conformsToProtocol:@protocol(DCTCoreDataViewControllerProtocol)]) {
		UIViewController<DCTCoreDataViewControllerProtocol> *coreDataSelf = (UIViewController<DCTCoreDataViewControllerProtocol> *)self;
		viewController.managedObjectContext = coreDataSelf.managedObjectContext;
	}
	
	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
	
	UINavigationController *viewControllersNav = viewController.navigationController;
	if ((viewControllersNav)) nav.navigationBar.tintColor = viewControllersNav.navigationBar.tintColor;
	
	UIViewController *vc = [self dct_furthestResponderOfClass:[UIViewController class]];
	[vc presentModalViewController:nav animated:animated];
	[nav release];
}

@end

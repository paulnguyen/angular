# Angular

* https://angular.io

### Getting Started (Local Development)

* https://angular.io/guide/setup-local
* https://nodejs.org

#### Use LTS version 14.17.X of Node.js

* https://nodejs.org/en/

![nodejs-download](images/nodejs-download.png)
![nodejs-install-location](images/nodejs-install-location.png)

### Getting Started

#### Install the Angular CLI

You use the Angular CLI to create projects, generate application and library code, and perform a variety of ongoing development tasks such as testing, bundling, and deployment.

To install the Angular CLI, open a terminal window and run the following command:

```      
npm install -g @angular/cli
```

![angular-install](images/angular-install.png)
![angular-install-version](images/angular-install-version.png)

#### Create a workspace and initial application

You develop apps in the context of an Angular workspace.

To create a new workspace and initial starter app:

* Run the CLI command ng new and provide the name my-app, as shown here:

  ```
  ng new my-app
  ```
  ![ng-new-my-app](images/ng-new-my-app.png)
 
        
* The ng new command prompts you for information about features to include in the initial app. Accept the defaults by pressing the Enter or Return key.

The Angular CLI installs the necessary Angular npm packages and other dependencies. This can take a few minutes.

The CLI creates a new workspace and a simple Welcome app, ready to run.


#### Run the application

The Angular CLI includes a server, so that you can build and serve your app locally.

* Navigate to the workspace folder, such as my-app.
* Run the following command:

```    
cd my-app
ng serve --open
```

![ng-serve-open](images/ng-serve-open.png)    

The ng serve command launches the server, watches your files, and rebuilds the app as you make changes to those files.

The --open (or just -o) option automatically opens your browser to http://localhost:4200/.

If your installation and setup was successful, you should see a page similar to the following.

![ng-run-my-app](images/ng-run-my-app.png)


#### Next steps

* Angular Concepts: https://angular.io/guide/architecture
* Angular Glossary: https://angular.io/guide/glossary
* Tour of Heroes Tutorial: https://angular.io/tutorial
* CLI Overview: https://angular.io/cli
* Workspace and Project File Structure: https://angular.io/guide/file-structure 

1. For a more thorough introduction to the fundamental concepts and terminology of Angular single-page app architecture and design principles, read the Angular Concepts section.

2. Work through the Tour of Heroes Tutorial, a complete hands-on exercise that introduces you to the app development process using the Angular CLI and walks through important subsystems.

3. To learn more about using the Angular CLI, see the CLI Overview. In addition to creating the initial workspace and app scaffolding, you can use the CLI to generate Angular code such as components and services. The CLI supports the full development cycle, including building, testing, bundling, and deployment.

4. For more information about the Angular files generated by ng new, see Workspace and Project File Structure.


### Getting Started (StackBlitz Cloud IDE)

* https://angular.io/start

#### Create the sample project

To create the sample project, generate the ready-made sample project in StackBlitz. To save your work:

1. Log into StackBlitz.
2. Fork the project you generated.
3. Save periodically.

In StackBlitz, the preview pane on the right shows the starting state of the example application. The preview features two areas:

* A top bar with the store name, My Store, and a checkout button
* A header for a product list, Products

![getting-started-1](images/getting-started-1.png)

The project section on the left shows the source files that make up the application, including the infrastructure and configuration files.

When you generate the StackBlitz example applications that accompany the tutorials, StackBlitz creates the starter files and mock data for you. The files you use throughout the tutorial are in the src folder.

For more information on how to use StackBlitz, see the StackBlitz documentation.  

* https://developer.stackblitz.com/docs/platform/

#### Create the product list

In this section, you'll update the application to display a list of products. You'll use predefined product data from the products.ts file and methods from the product-list.component.ts file. This section guides you through editing the HTML, also known as the template.

1. In the product-list folder, open the template file product-list.component.html.

2. Add an *ngFor structural directive on a ```<div>```, as follows.

* src/app/product-list/product-list.component.html

```   
	<h2>Products</h2>
	<div *ngFor="let product of products">
	</div>
```

* With ```*ngFor```, the ```<div>``` repeats for each product in the list.

* Structural directives shape or reshape the DOM's structure, by adding, removing, and manipulating elements. For more information about structural directives, see Structural directives.

* https://angular.io/guide/structural-directives

![getting-started-2](images/getting-started-2.png)


3. Inside the ```<div>```, add an ```<h3>``` and ```{{ product.name }}```. The ```{{ product.name }}``` statement is an example of Angular's interpolation syntax. Interpolation ```{{ }}``` lets you render the property value as text.

* src/app/product-list/product-list.component.html

```
<h2>Products</h2>
<div *ngFor="let product of products">
  <h3>
      {{ product.name }}
  </h3>
</div>
```

* The preview pane updates to display the name of each product in the list.

![getting-started-3](images/getting-started-3.png)


4. To make each product name a link to product details, add the ```<a>``` element around ```{{ product.name }}```.

5. Set the title to be the product's name by using the property binding ```[ ]``` syntax, as follows:

* src/app/product-list/product-list.component.html

```
<h2>Products</h2>
<div *ngFor="let product of products">
  <h3>
    <a [title]="product.name + ' details'">
      {{ product.name }}
    </a>
  </h3>
</div>
```

![getting-started-4](images/getting-started-4.png)

* In the preview pane, hover over a product name to see the bound name property value, which is the product name plus the word "details". Property binding ```[ ]``` lets you use the property value in a template expression.

6. Add the product descriptions. On a ```<p>``` element, use an ```*ngIf``` directive so that Angular only creates the ```<p>``` element if the current product has a description.

* src/app/product-list/product-list.component.html

```
<h2>Products</h2>
<div *ngFor="let product of products">
  <h3>
    <a [title]="product.name + ' details'">
      {{ product.name }}
    </a>
  </h3>
  <p *ngIf="product.description">
    Description: {{ product.description }}
  </p>
</div>
```

![getting-started-5](images/getting-started-5.png)

* The application now displays the name and description of each product in the list. Notice that the final product does not have a description paragraph. Angular doesn't create the ```<p>``` element because the product's description property is empty.


7. Add a button so users can share a product. Bind the button's click event to the ```share()``` method in ```product-list.component.ts```. Event binding uses a set of parentheses, ```( )```, around the event, as in the ```(click)``` event on the ```<button>``` element.

* src/app/product-list/product-list.component.html

```
<h2>Products</h2>
<div *ngFor="let product of products">
  <h3>
    <a [title]="product.name + ' details'">
      {{ product.name }}
    </a>
  </h3>
  <p *ngIf="product.description">
    Description: {{ product.description }}
  </p>
  <button (click)="share()">
    Share
  </button>
</div>
```

![getting-started-6a](images/getting-started-6a.png)

* Each product now has a Share button.

![getting-started-6b](images/getting-started-6b.png)

*  Clicking the Share button triggers an alert that states, "The product has been shared!".

![getting-started-6c](images/getting-started-6c.png)

In editing the template, you have explored some of the most popular features of Angular templates. For more information, see Introduction to components and templates.

* https://angular.io/guide/architecture-components#template-syntax


#### Pass data to a child component

Currently, the product list displays the name and description of each product. The ```ProductListComponent``` also defines a ```products property``` that contains imported data for each product from the products array in ```products.ts```.

The next step is to create a new alert feature that uses product data from the ```ProductListComponent```. The alert checks the product's price, and, if the price is greater than $700, displays a Notify Me button that lets users sign up for notifications when the product goes on sale.

This section walks you through creating a child component, ```ProductAlertsComponent``` that can receive data from its parent component, ```ProductListComponent```.

1. Right click on the app folder and use the Angular Generator to generate a new component named ```product-alerts```.

![getting-started-7a](images/getting-started-7a.png)
![getting-started-7b](images/getting-started-7b.png)
![getting-started-7c](images/getting-started-7c.png)

*  The generator creates starter files for the three parts of the component:
   * product-alerts.component.ts
   * product-alerts.component.html
   * product-alerts.component.css

2. Open ```product-alerts.component.ts```. The ```@Component()``` decorator indicates that the following class is a component. ```@Component()``` also provides metadata about the component, including its selector, templates, and styles.

![getting-started-8](images/getting-started-8.png)

* Key features in the ```@Component()``` are as follows:
  * The selector, ```app-product-alerts```, identifies the component. By convention, Angular component selectors begin with the prefix ````app-```, followed by the component name.
  * The template and style filenames reference the component's HTML and CSS.
  * The ```@Component()``` definition also exports the class, ProductAlertsComponent, which handles functionality for the component.

3. To set up ```ProductAlertsComponent``` to receive product data, first import Input from ```@angular/core```.

* src/app/product-alerts/product-alerts.component.ts

```
import { Component, OnInit } from '@angular/core';
import { Input } from '@angular/core';
import { Product } from '../products';
```

![getting-started-9](images/getting-started-9.png)


4. In the ```ProductAlertsComponent``` class definition, define a property named ```product``` with an ```@Input()``` decorator. The @Input() decorator indicates that the property value passes in from the component's parent, ```ProductListComponent```.

* src/app/product-alerts/product-alerts.component.ts

```
export class ProductAlertsComponent implements OnInit {
  @Input() product!: Product;
  constructor() { }

  ngOnInit() {
  }

}
```

![getting-started-10](images/getting-started-10.png)

5. Open ```product-alerts.component.html``` and replace the placeholder paragraph with a ```Notify Me``` button that appears if the product price is over $700.

* src/app/product-alerts/product-alerts.component.html

```
<p *ngIf="product && product.price > 700">
  <button>Notify Me</button>
</p>
```

![getting-started-11](images/getting-started-11.png)

6. To display ```ProductAlertsComponent`` as a child of ```ProductListComponent```, add the selector, ```<app-product-alerts>``` to ```product-list.component.html```. Pass the current product as input to the component using property binding.

* src/app/product-list/product-list.component.html

```
<button (click)="share()">
  Share
</button>

<app-product-alerts
  [product]="product">
</app-product-alerts>
```

![getting-started-12](images/getting-started-12.png)

* The new product alert component takes a product as input from the product list. With that input, it shows or hides the Notify Me button, based on the price of the product. The Phone XL price is over $700, so the Notify Me button appears on that product.




#### Pass data to a parent component

To make the Notify Me button work, the child component needs to notify and pass the data to the parent component. The ```ProductAlertsComponent``` needs to emit an event when the user clicks Notify Me and the ```ProductListComponent``` needs to respond to the event.

> In new components, the Angular Generator includes an empty constructor(), the OnInit interface, and the ngOnInit() method. Since these steps don't use them, the following code examples omit them for brevity.

1. In ```product-alerts.component.ts```, import ```Output``` and ```EventEmitter``` from ```@angular/core```.

* src/app/product-alerts/product-alerts.component.ts

```
import { Component } from '@angular/core';
import { Input } from '@angular/core';
import { Output, EventEmitter } from '@angular/core';
import { Product } from '../products';
```

![getting-started-13](images/getting-started-13.png)

2. In the component class, define a property named notify with an ```@Output()``` decorator and an instance of ```EventEmitter()```. Configuring ```ProductAlertsComponent``` with an ```@Output()`` allows the ```ProductAlertsComponent``` to emit an event when the value of the notify property changes.

* src/app/product-alerts/product-alerts.component.ts

```
export class ProductAlertsComponent {
  @Input() product: Product|undefined;
  @Output() notify = new EventEmitter();
}
```

![getting-started-14](images/getting-started-14.png)

3. In ```product-alerts.component.html```, update the Notify Me button with an event binding to call the ``notify.emit()``` method.

* src/app/product-alerts/product-alerts.component.html

```
<p *ngIf="product && product.price > 700">
  <button (click)="notify.emit()">Notify Me</button>
</p>
```

![getting-started-15](images/getting-started-15.png)

4. Define the behavior that happens when the user clicks the button. The parent, ```ProductListComponent``` (not the ProductAlertsComponent) acts when the child raises the event. In ```product-list.component.ts```, define an ```onNotify()``` method, similar to the ```share()``` method.

* src/app/product-list/product-list.component.ts

```
export class ProductListComponent {
  products = products;

  share() {
    window.alert('The product has been shared!');
  }

  onNotify() {
    window.alert('You will be notified when the product goes on sale');
  }
}
```

![getting-started-16](images/getting-started-16.png)


5. Update the ```ProductListComponent``` to receive data from the ```ProductAlertsComponent```.  In ```product-list.component.html```, bind ```<app-product-alerts>``` to the ```onNotify()``` method of the product list component. ```<app-product-alerts>``` is what displays the Notify Me button.

* src/app/product-list/product-list.component.html

```
<button (click)="share()">
  Share
</button>

<app-product-alerts
  [product]="product" 
  (notify)="onNotify()">
</app-product-alerts>
```

![getting-started-17](images/getting-started-17.png)


6. Click the Notify Me button to trigger an alert which reads, "You will be notified when the product goes on sale".


![getting-started-18](images/getting-started-18.png)


For more information on communication between components, see Component Interaction.

* https://angular.io/guide/component-interaction





1. Inheritance
- Inheriting all methods from parent class
    - ChildClass < ParentClass
- Methods can be changed in child class when needed

2. Composition
- Making attributes composed of other objects (i.e. groups)
- Compartmentalize
    - Example:
    - Instead of Laptop class attributes having:
        - screen_size
        - screen_resolution
        - screen_etc
    - Make @screen = Screen.new (Class for Screen itself, to then put into Laptop class)

3. Encapsulation
- Ensure objects are isolated from each other
- Minimize public interface of an object
- Private method: Cannot be called outside of a class

4. Duck Typing
- Using the same method name consisting of different functions in different classes
- Can use the method name to call all functions

5. Law of Demeter
- Not chaining many methods together

6. Overriding Methods (and using super)
- super = A mechanism by which an overridden method can be called by the overriding method
  - Takes all functions from the method of THE SAME NAME of ParentClass

7. Modules
- Modules are about providing methods that you can use across multiple classes
  - Think about them as "libraries".
- Classes are about objects, Modules are about functions.
- Modules used for: Calculations (math, percentages, etc)
    - To apply in class, use "include (module name)"

8. Scope
- Environment the method can "move around" in

9. Private VS Public Methods
- Private method: Cannot be called outside of a class
- Public method: Can be called outside of a class

10. Separation of Concerns
- Each class should encapsulate one concept that is useful in the application
(i.e. Each class should be concerned with ONE responsibility)

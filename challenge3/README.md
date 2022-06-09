Function to pass in the object and get the key value.

var object = {"a": { "b": { "c": "d" }}};
console.log("Result at 'a.b.c': ",_.get(object, 'a.b.c'));

var object2 = {"x":{"y":{"z":"a"}}};
console.log("Result at 'x.y.z': ",_.get(object2, 'x.y.z'));

expected output:
Result at 'a.b.c':  d
Result at 'x.y.z’:  a


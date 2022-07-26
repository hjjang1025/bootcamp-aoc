open Belt
let input = Node.Fs.readFileAsUtf8Sync("input/Week1/2020-3.sample.txt")

//input->Js.log

//["a", "b", "c"]->Belt.Array.forEach(x => Js.log(x))

//Js.String.split("-", "")

Js.String.split("\n", input)->Js.log

//"abc"->Belt.Array.forEach(x => Js.log(x))

// let strArr = Js.String.castToArrayLike("abcd");
// // strArr->Js.log

// Js.String2.length("abcd")->Js.log

let hasTree = (index, treeMap): bool => {
    if index == 0 {false} else {
        let treeArray = Js.Array2.from(Js.String.castToArrayLike(treeMap))
        let treeIndex = mod(index * 3,
                            Js.String2.length(treeMap)) 
        ("#" === Js.Option.getWithDefault("", (treeArray[treeIndex])))                            
    }
}

hasTree(0, "####...##")->Js.log

let total = ref(0)

let countTree = (index, treeMap) => {
    if index != 0 {
        let treeArray = Js.Array2.from(Js.String.castToArrayLike(treeMap))
        let treeIndex = mod(index * 3,
                            Js.String2.length(treeMap)) 
        if ("#" === Js.Option.getWithDefault("", (treeArray[treeIndex]))) {
            total := total.contents + 1
        }                            
    }
}

total->Js.log

Js.String.split("\n", input)
//->Belt.Array.forEach(x => repeatTreeMap(x))
->Belt.Array.forEach(x => Js.log(x))


// Belt.Array.forEachWithIndex([10, 11, 12, 13], (i, x) => total := total.contents + x + i)

let lines = Js.String.split("\n", input)
//Belt.Array.forEachWithIndex(lines, (i, x) => (hasTree(i, x)))
//->Belt.Array.keep(x => true)


//Belt.Array.forEachWithIndex(lines, (i, x): bool => hasTree(i, x))


//->Belt.Array.forEachWithIndex((i, x) => hasTree(i, x))
//->Belt.Array.keep(x => x)


// let trees =
//   lines
//   ->Belt.Array.forEachWithIndex((i, x) => bool, (i, x) => hasTree(i, x))
//   ->Belt.Array.keep(x => x)

lines
->Belt.Array.forEachWithIndex((i, x) => countTree(i, x))
total->Js.log

let someNumbers = [1, 1, 4, 2, 3, 6, 3, 4, 2]

// let greaterThan2UniqueAndSorted =
//   someNumbers
//   ->Belt.Array.keep(x => x > 2)
//   // convert to and from set to make values unique
//   ->Belt.Set.Int.fromArray
//   ->Belt.Set.Int.toArray // output is already sorted

// Js.log2("result", greaterThan2UniqueAndSorted)
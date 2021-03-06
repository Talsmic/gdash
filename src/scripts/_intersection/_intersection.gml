/// @func _intersection(arrays...)
/// @desc Creates an array of unique values common to all given arrays in the order in which they originally appeared.
/// @param {Array} arrays... The arrays to be intersected
/// @returns {Array} The intersection of the given arrays
/*
@example
var arr0 = [0, 1];
var arr1 = [0];
_intersection(arr0, arr1);
// => [0];

var arr0 = ['Sword', 'Potion'];
var arr1 = ['Shield', 'Potion', 'Sword'];
_intersection(arr0, arr1);
// => ['Sword', 'Potion'];
*/

if (argument_count == 0) return array_create(0);
if (argument_count == 1) return argument[0];

var i;
var j;
var n;
var arr;
var len;
var set;
var result;

set = ds_map_create();

for (i = 1; i < argument_count; i++) {
    arr = argument[i];
    len = array_length_1d(arr);
    for (j = 0; j < len; j++) {
        if (i == 1 || set[? arr[j]] == i - 1) {
            set[? arr[j]] = i;
        }
    }
}

n    = 0;
arr = argument[0];
len = array_length_1d(arr);
result = array_create(0);

for (i = 0; i < len; i++) {
    if (set[? arr[i]] == argument_count - 1) {
        set[? arr[i]]++;
        result[n++] = arr[i];
    }
}

ds_map_destroy(set);
return result;

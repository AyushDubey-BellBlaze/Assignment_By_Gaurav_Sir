""" Finding the missing element in the given array """
def find_missing_element(arr, n):
    total_sum = n * (n + 1) // 2
    arr_sum = sum(arr)
    missing_element = total_sum - arr_sum
    return missing_element

if __name__ == "__main__":
    arr = [1, 2, 3, 5, 6]
    n = 6  # The array should contain numbers from 1 to 6
    missing_element = find_missing_element(arr, n)
    print(f"The missing element is: {missing_element}") 

""" Finding the missing element in the given array (also including neagtive number in the array) """
arr = [-1,-2,1,2,3,5,0,7,4]
num_set = set(arr)
min_val = min(arr)
max_val = max(arr)

for i in range (min_val,max_val+1):
    if i not in num_set:
        print(f"The missing element is: {i}")
        break


import { readFileSync } from 'fs'

const reducer_part_one = (accumulator, value, index, array) => {
  value < array[index+1] ? accumulator++ : null
  return accumulator
}

const reducer_part_two = (accumulator, value, index, array) => {
  const first_val = value + array[index + 1] + array[index + 2]
  const second_val = array[index + 1] + array[index + 2] + array[index + 3]
  first_val < second_val ? accumulator++ : null
  return accumulator
}

const get_solution = (reducer) => {
  return readFileSync('./input.txt', 'utf8')
  .split("\n")
  .map((x) => parseInt(x))
  .reduce(reducer, 0)
}

console.log(get_solution(reducer_part_one))
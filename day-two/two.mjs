import { readFileSync } from 'fs'

const get_commands = (file) => {
  return readFileSync(file, 'utf8')
    .split('\n')
}

const reducer_part_one = (accumulator, value) => {
  const command = value.split(' ')
  const distance = parseInt(command[1])

  if(command.includes('forward')){
    accumulator.x_axis += distance
  } else if(command.includes('up')){
    accumulator.y_axis -= distance
  } else {
    accumulator.y_axis += distance
  }
  return accumulator
}

const reducer_part_two = (accumulator, value) => {
  const command = value.split(' ')
  const distance = parseInt(command[1])

  if(command.includes('forward')){
    accumulator.x_axis += distance
    accumulator.y_axis += accumulator.aim * distance
  } else if(command.includes('up')){
    accumulator.aim -= distance
  } else {
    accumulator.aim += distance
  }
  return accumulator
}

const result = get_commands('./input.txt').reduce(reducer_part_two, {x_axis:0, y_axis: 0, aim: 0})
console.log(result)
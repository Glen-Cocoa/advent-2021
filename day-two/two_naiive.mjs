import { readFileSync } from 'fs'

const commands =
  readFileSync('./input.txt', 'utf8')
    .split('\n')
    .sort()

const accumulator = {
  up: get_total_distance('up'),
  down: get_total_distance('down'),
  forward: get_total_distance('forward')
}

const get_total_distance = (direction, list) => {
  list.filter((cmnd) => {
    return cmnd.split(' ')[0] === direction
  }).map((cmnd) => {
    return parseInt(cmnd.split(' ')[1])
  }).reduce((val, acc) => val + acc)
}

console.log(accumulator)

// const down = commands.filter((cmnd) => {
//   return cmnd.split(' ')[0] === 'down'
// }).map((cmnd) => {
//   return parseInt(cmnd.split(' ')[1])
// }).reduce((val, acc) => val + acc)

// const up = commands.filter((cmnd) => {
//   return cmnd.split(' ')[0] === 'up'
// }).map((cmnd) => {
//   return parseInt(cmnd.split(' ')[1])
// }).reduce((val, acc) => val + acc)

// const forward = commands.filter((cmnd) => {
//   return cmnd.split(' ')[0] === 'forward'
// }).map((cmnd) => {
//   return parseInt(cmnd.split(' ')[1])
// }).reduce((val, acc) => val + acc)


// const vertical = up - down
// const total = forward * -vertical


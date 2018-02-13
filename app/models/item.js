'use strict'

const mongoose = require('mongoose')

const itemSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: false
  }
   // ,
  // _owner: {
  //   type: mongoose.Schema.Types.ObjectId,
  //   ref: 'User',
  //   required: true
  // }
}, {
  // timestamps: true,
  toJSON: {
    // virtuals: true,
    // transform: function (doc, ret, options) {
    //   const userId = (options.user && options.user._id) || false
    //   ret.editable = userId && userId.equals(doc._owner)
    //   return ret
    // }
  }
})

// itemSchema.virtual('length').get(function length () {
//   return this.text.length
// })

const Item = mongoose.model('Item', itemSchema)

module.exports = Item

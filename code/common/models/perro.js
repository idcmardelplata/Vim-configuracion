module.exports = function(Perro) {
Perro.validatesUniquenessOf("name", 
    {
      message: 'El nombre del pérro ya esta en uso.'
    });

  Perro.observe('before save', function(ctx, next)
      {
        if (ctx.instance) {
          ctx.instance.edad_en_perro = ctx.instance.edad * 7;
        }
        else { 
        }
          next();
      });

  Perro.saluden = function(msg, cb) {
    return cb(null, "Guau" + msg);
  }

  Perro.remoteMethod('saluden', {
    accepts: { arg: 'msg', type: 'string' },
    returns: { arg: "greeting", type: "string" }
  });


};

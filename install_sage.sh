#!/bin/bash
cd /opt
wget http://www-ftp.lip6.fr/pub/math/sagemath/src/sage-7.0.tar.gz
tar -xf sage-7.0.tar.gz
rm sage-7.0.tar.gz
ln -sf sage-7.0 sage
cd sage
make
./sage <<EOFSAGE
    from sage.misc.misc import DOT_SAGE
    from sagenb.notebook import notebook
    directory = DOT_SAGE+'sage_notebook'
    nb = notebook.load_notebook(directory)
    nb.user_manager().add_user('admin', 'sage', '', force=True)
    nb.save()
    quit
EOFSAGE
ln -sf /opt/sage/sage /usr/bin/sage
chown -R sage:sage /opt/SageMath
#!/bin/bash
cd /opt
wget ftp://ftp.fu-berlin.de/unix/misc/sage/linux/64bit/sage-6.10-Ubuntu_14.04-x86_64.tar.bz2
tar -xf sage-6.10-Ubuntu_14.04-x86_64.tar.bz2
rm sage-6.10-Ubuntu_14.04-x86_64.tar.bz2
cd SageMath
./sage <<EOFSAGE
    from sage.misc.misc import DOT_SAGE
    from sagenb.notebook import notebook
    directory = DOT_SAGE+'sage_notebook'
    nb = notebook.load_notebook(directory)
    nb.user_manager().add_user('admin', 'sage', '', force=True)
    nb.save()
    quit
EOFSAGE
ln -snf /opt/SageMath/sage /usr/bin/sage
chown -R sage:sage /opt/SageMath
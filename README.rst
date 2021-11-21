redis-export
============================

Export redis keys with a given prefix or pattern, which later can be imported
to another redis server.

Installation
------------

To install redis-export, simply:

.. code-block:: bash

   $ pip install redis-export

You should add ~/.local/bin/ to your PATH.

Quick Start
-----------

.. code-block:: bash

   redis-export PATTERN OUTPUT_FILE
   redis-import INPUT_FILE

For example,

.. code-block:: bash

   redis-export 'phonebook:' ~/d/t1.json
   # redis-export 'phonebook:*:name:*' ~/d/t1.json
   redis-export ~/d/t1.json

For more usage help, run the command with --help option.

Documentation
-------------

redis-export will export keys with given pattern to a json file (keys and
values both base64 encoded).

redis-import will import those keys and values back to redis.

Implementation Detail
-------------------------

- SCAN is used to iterate over keys with given pattern.
- DUMP is used to dump the key.
- RESTORE is used to restore a key. force-replace param is set to TRUE.

Exported file is a json list, each list item is of form (key, dump_value).
The redis key and dump value is encoded in base64 in order to fit in regular
json.

ChangeLog
---------

* v0.1.0 2021-11-21

  - initial release

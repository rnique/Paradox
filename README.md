![Paradox Logo](assets/logo.png)

### Paradox - A beautiful ODM (Object Document Manager) for ArangoDB


Master (stable): [![Build Status](https://travis-ci.org/F21/Paradox.png?branch=master)](https://travis-ci.org/F21/Paradox)
&nbsp;&nbsp;&nbsp;&nbsp;Devel (unstable): [![Build Status](https://travis-ci.org/F21/Paradox.png?branch=devel)](https://travis-ci.org/F21/Paradox)

----------------------------------------------------------------------------

### Supported ArangoDB Version
1.3.1

### Welcome
Paradox is an elegant Object Document Mananger (ODM) to use with the ArangoDB Document/Graph database server. It's designed
to be simple and expressive. We favor convention over configuration and eschewing passing loads of configuration options
to each method. Paradox embraces AQL instead of inventing its own query language. Finally, Paradox is designed to be easy to
learn and fun to use.

Paradox is inspired by [RedBean](https://github.com/gabordemooij/redbean).

This is a taste of how Paradox works:

    $client = new Paradox\Client('tcp://localhost:8529', 'root', 'password');
    
    $document = $client->dispense('people'); //Create a people document to be stored in the people collection
    $document->set('name', 'john');
    $document->set('age', 20);
    
    $id = $client->store($document); //Save the document to the server
    
    $document = $client->load('people', $id); //Load the document from the server
    
    $client->delete($document); //Delete the document from the server

### Key Features
* Event system that exposes various events to listeners.
* Built in support for models to model domain objects.
* A debugger to quickly debug request and responses.
* Various finders to make finding documents, vertices and edges extremely simple.

### Install
Paradox can be installed using composer or from git.

#### Using composer
Simply add Paradox to your `composer.json`:

    {
        "require": {
            "F21/Paradox": "dev-master"
        }
    }
    
Then use the autoloader generated by composer:

    require_once 'vendor/autoload.php';

#### Cloning from git
First, install [ArangoDB-PHP](https://github.com/triAGENS/ArangoDB-PHP) by cloning it into your project. Then, include
the autoloader:

    require_once '/path/to/ArangoDB-PHP/lib/triagens/ArangoDb/autoloader.php'
    \triagens\ArangoDb\Autoloader::init();

Simply clone this repository into your project and include the bundled autoloader:

    require_once '/path/to/paradox/Paradox/Autoloader.php'
    Paradox\Autoloader::init();
    
Hint: Since ArangoDB-PHP and Paradox uses PSR-0 for organising class files, you can use your own autoloader instead.

### Using Paradox
If you are new to Paradox, we recommend reading our documentation in the [wiki](https://github.com/F21/Paradox/wiki).

----------------------------------------------------------------------------

### Versioning
Paradox tracks the version of ArangoDB. For example, if Pardox is version 1.2.x, then it is expected to work with 1.2.x of ArangoDB.
Note that we only track the major and minor version of ArangoDB. The patch version (last number) is independent or ArangoDB and specific to Paradox.

### Contributing
Paradox is a very new library, so your contributions (issues and pull request) are appreciated :)

When contributing, please take note of the following
* Code is to be in psr-2 standard + all. For a list standards, see the list on the [php-cs-fixer](https://github.com/fabpot/PHP-CS-Fixer) page.
* If you want to use php-cs-fixer, run it with `php-cs-fixer fix /path/to/project --level=all`.
* When submitting a PR, make sure you also include tests to test all code paths of your addition. 

### License
Paradox is licensed under [Apache2](http://www.apache.org/licenses/LICENSE-2.0.html).
    

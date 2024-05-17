<?php

declare(strict_types=1);

namespace RoaveTest\BackwardCompatibility\LocateSources;

use PHPUnit\Framework\TestCase;
use Roave\BackwardCompatibility\LocateSources\LocateSourcesViaComposerJson;
use Roave\BetterReflection\BetterReflection;
use Roave\BetterReflection\Reflector\DefaultReflector;

/** @covers \Roave\BackwardCompatibility\LocateSources\LocateSourcesViaComposerJson */
final class LocateSourcesInSubmoduleViaComposerJsonTest extends TestCase
{
    private LocateSourcesViaComposerJson $locateSources;

    protected function setUp(): void
    {
        parent::setUp();

        $this->locateSources = new LocateSourcesViaComposerJson((new BetterReflection())->astLocator());
    }

    public function testCanLocateClassInMappendAutoloadDefinitions(): void
    {
        $reflector = new DefaultReflector(
            ($this->locateSources)(__DIR__ . '/../../asset/located-sources/superproject-with-git-submodule/submodule'),
        );

        self::assertSame(
            'baz\\LocatedClass',
            $reflector
                ->reflectClass('baz\\LocatedClass')
                ->getName(),
        );
    }
}

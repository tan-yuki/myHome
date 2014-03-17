snippet cla

namespace Cw\${1:#namespace}

/**
 * 
 * @author tanaka yuki
 */
class ${2:#name} {
    ${3:#contents}
}

snippet publ
    /**
     * 
     * @param
     * @return
     */
    public function ${1:#name}(${2:#args}) {
        ${3:#contents}
    }

snippet prot
    /**
     * 
     * @param
     * @return
     */
    protected function ${1:#name}(${2:#args}) {
        ${3:#contents}
    }

snippet priv
    /**
     * 
     * @param
     * @return
     */
    private function ${1:#name}(${2:#args}) {
        ${3:#contents}
    }

snippet func
    /**
     * 
     * @param
     * @return
     */
    ${1:#access} function ${2:#name}(${3:#args}) {
        ${4:#contents}
    }

snippet test
    /**
     * @test
     * @covers Cw\${1:#covers}
     */
    public function ${2:#name}() {
        ${3:#contents}
    }

/**
 * 创建自 ${System.getProperty("user.name")} on ${new Date().format("yyyy-MM-dd")}.
 */
package ${packageName}
import java.io.Serializable;
import grails.gorm.DetachedCriteria;
import org.apache.commons.lang.builder.HashCodeBuilder
import ${domainMap["className"]}
import ${domainMap2["className"]}
<%

import com.ms.base.template.*

%>


class ${fileName} implements Serializable{
    private static final long serialVersionUID = 1
    <%
        def domain1="${domainMap["shortName"]} ${domainMap["propertyName"]}"
        def domain2="${domainMap2["shortName"]} ${domainMap2["propertyName"]}"
    %>
    ${domain1}
    ${domain2}

    ${fileName}(${domain1},${domain2}) {
        this.${domainMap["propertyName"]} = ${domainMap["propertyName"]}
        this.${domainMap2["propertyName"]} = ${domainMap2["propertyName"]}
    }
    boolean equals(other) {
        if (!(other instanceof ${fileName})) {
            return false
        }
        other.${domainMap["propertyName"]}?.id == ${domainMap["propertyName"]}?.id &&
                other.${domainMap2["propertyName"]}?.id == ${domainMap2["propertyName"]}?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (${domainMap["propertyName"]}) builder.append(${domainMap["propertyName"]}.id)
        if (${domainMap2["propertyName"]}) builder.append(${domainMap2["propertyName"]}.id)
        builder.toHashCode()
    }

    static ${fileName} get(String ${domainMap["propertyName"]}Id, String ${domainMap2["propertyName"]}Id) {
        criteriaFor(${domainMap["propertyName"]}Id, ${domainMap2["propertyName"]}Id).get()
    }

    static boolean exists(String ${domainMap["propertyName"]}Id, String ${domainMap2["propertyName"]}Id) {
        criteriaFor(${domainMap["propertyName"]}Id, ${domainMap2["propertyName"]}Id).count()
    }
    private static DetachedCriteria criteriaFor(String ${domainMap["propertyName"]}Id, String ${domainMap2["propertyName"]}Id) {
        ${fileName}.where {
            ${domainMap["propertyName"]} == ${domainMap["shortName"]}.load(${domainMap["propertyName"]}Id) &&
                    ${domainMap2["propertyName"]} == ${domainMap2["shortName"]}.load(${domainMap2["propertyName"]}Id)
        }
    }

    static List<${fileName}> listAllBy${domainMap["shortName"]}(String ${domainMap["propertyName"]}Id) {
        ${fileName}.list{
            eq("${domainMap["propertyName"]}.id",${domainMap["propertyName"]}Id)
        }
    }

    static List<${fileName}> listAllBy${domainMap2["shortName"]}(String ${domainMap2["propertyName"]}Id) {
        ${fileName}.list{
            eq("${domainMap2["propertyName"]}.id",${domainMap2["propertyName"]}Id)
        }
    }
    static List<${fileName}> listAll(${domain1}) {
        ${fileName}.list{
            eq("${domainMap["propertyName"]}",${domainMap["propertyName"]})
        }
    }
    static List<${fileName}> listAll(${domain2}) {
        ${fileName}.list{
            eq("${domainMap2["propertyName"]}",${domainMap2["propertyName"]})
        }
    }



    static ${fileName} create(${domain1}, ${domain2},boolean flush = false) {
        def instance = new ${fileName}(${domainMap["propertyName"]},${domainMap2["propertyName"]})
        instance.save(flush: flush, insert: true)
        instance
    }

    static boolean remove(${domain1}, ${domain2}, boolean flush = false) {
        if (${domainMap["propertyName"]} == null || ${domainMap2["propertyName"]} == null) return false

        int rowCount = ${fileName}.where { ${domainMap["propertyName"]} == ${domainMap["propertyName"]} && ${domainMap2["propertyName"]} == ${domainMap2["propertyName"]} }.deleteAll()

        if (flush) {
            ${fileName}.withSession { it.flush()
            }
        }

        rowCount
    }

    static void removeAll(${domain1}, boolean flush = false) {
        if (${domainMap["propertyName"]} == null) return
            ${fileName}.where { ${domainMap["propertyName"]} == ${domainMap["propertyName"]} }.deleteAll()
        if (flush) {
            ${fileName}.withSession { it.flush()
            }
        }
    }

    static void removeAll(${domain2}, boolean flush = false) {
        if (${domainMap2["propertyName"]} == null) return
        ${fileName}.where { ${domainMap2["propertyName"]} == ${domainMap2["propertyName"]} }.deleteAll()
        if (flush) {
            ${fileName}.withSession { it.flush()
            }
        }
    }
    static mapping = {
        id composite: ['${domainMap["propertyName"]}', '${domainMap2["propertyName"]}']
        version false
    }
}

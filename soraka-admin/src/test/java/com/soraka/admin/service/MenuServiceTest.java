/*
 * Apache License
 * Version 2.0, January 2004
 *
 *    Copyright 2018 北有风雪 (yongjie.teng@qq.com)
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package com.soraka.admin.service;

import com.soraka.common.constant.Constants;
import com.soraka.common.model.domain.MenuDO;
import com.soraka.admin.model.dto.VueRouter;
import com.soraka.admin.util.TreeUtil;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MenuServiceTest {

    @Autowired
    MenuService menuService;

    @Test
    public void get() {
        MenuDO menu = menuService.get(1L);
        Assert.assertNotNull(menu);
    }

    @Test
    public void getUserPermission()  {
        List<String> perms = menuService.getUserPermission(1L);
        Assert.assertNotEquals(0, perms.size());
    }

    @Test
    public void getRoleMenu() {
        List<String> roleKeys = new ArrayList<>();
        roleKeys.add("admin");
        roleKeys.add("tech");
        roleKeys.add("editor");
        List<MenuDO> menus = menuService.getRoleMenu(roleKeys);
        List<VueRouter> routers = new ArrayList<>();
        menus.forEach(menuDO -> {
            if (Constants.MENU == menuDO.getType()) {
                routers.add(new VueRouter(menuDO));
            }
        });
        Collections.sort(routers, Comparator.comparingInt(VueRouter::getSort));
        List<VueRouter> tree = TreeUtil.build(routers, 0L);
        System.out.println(tree);
        Assert.assertNotEquals(0, menus.size());
    }
}

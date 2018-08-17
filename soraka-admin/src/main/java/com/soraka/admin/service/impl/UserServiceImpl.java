package com.soraka.admin.service.impl;

import com.soraka.admin.dao.UserDAO;
import com.soraka.admin.model.domain.UserDO;
import com.soraka.admin.service.RoleService;
import com.soraka.admin.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author yongjie.teng
 * @date 2018/8/16
 * @package com.soraka.admin.service.impl
 */
@Transactional(rollbackFor = {RuntimeException.class})
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO userDAO;
    @Autowired
    RoleService roleService;

    /**
     * 根据主键获取用户信息
     *
     * @param id 主键
     * @return {@link UserDO}
     */
    @Override
    public UserDO get(Long id) {
        UserDO userDO = userDAO.get(id);
        if (userDO != null) {
            userDO.setRoles(roleService.findByUserId(userDO.getId()));
        }
        return userDO;
    }
}
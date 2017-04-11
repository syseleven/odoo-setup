# -*- coding: utf-8 -*-

from openerp import models, fields

class ResPartner(models.Model):
    _inherit = "res.partner"

    gender = fields.Selection(string="Gender",
                              help="Gender of Contact",
                              selection=[('male', 'Male'),
                                         ('female', 'Female'),
                                         ('unknown', 'Other')],
                              default=False,
                              required=True)

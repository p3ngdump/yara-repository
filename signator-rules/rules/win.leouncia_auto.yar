rule win_leouncia_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.leouncia."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.leouncia"
        malpedia_rule_date = "20220513"
        malpedia_hash = "7f4b2229e6ae614d86d74917f6d5b41890e62a26"
        malpedia_version = "20220516"
        malpedia_license = "CC BY-SA 4.0"
        malpedia_sharing = "TLP:WHITE"

    /* DISCLAIMER
     * The strings used in this rule have been automatically selected from the
     * disassembly of memory dumps and unpacked files, using YARA-Signator.
     * The code and documentation is published here:
     * https://github.com/fxb-cocacoding/yara-signator
     * As Malpedia is used as data source, please note that for a given
     * number of families, only single samples are documented.
     * This likely impacts the degree of generalization these rules will offer.
     * Take the described generation method also into consideration when you
     * apply the rules in your use cases and assign them confidence levels.
     */


    strings:
        $sequence_0 = { 83e103 f3a4 c644041800 8d442418 50 }
            // n = 5, score = 100
            //   83e103               | and                 ecx, 3
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   c644041800           | mov                 byte ptr [esp + eax + 0x18], 0
            //   8d442418             | lea                 eax, [esp + 0x18]
            //   50                   | push                eax

        $sequence_1 = { 8bb42430540000 8bc8 8bd1 57 8d7c2430 50 c1e902 }
            // n = 7, score = 100
            //   8bb42430540000       | mov                 esi, dword ptr [esp + 0x5430]
            //   8bc8                 | mov                 ecx, eax
            //   8bd1                 | mov                 edx, ecx
            //   57                   | push                edi
            //   8d7c2430             | lea                 edi, [esp + 0x30]
            //   50                   | push                eax
            //   c1e902               | shr                 ecx, 2

        $sequence_2 = { 51 e8???????? 83c404 a3???????? 85c0 5f 5e }
            // n = 7, score = 100
            //   51                   | push                ecx
            //   e8????????           |                     
            //   83c404               | add                 esp, 4
            //   a3????????           |                     
            //   85c0                 | test                eax, eax
            //   5f                   | pop                 edi
            //   5e                   | pop                 esi

        $sequence_3 = { 55 56 33db 57 8b3d???????? 8d442434 53 }
            // n = 7, score = 100
            //   55                   | push                ebp
            //   56                   | push                esi
            //   33db                 | xor                 ebx, ebx
            //   57                   | push                edi
            //   8b3d????????         |                     
            //   8d442434             | lea                 eax, [esp + 0x34]
            //   53                   | push                ebx

        $sequence_4 = { 6a10 8b5108 8954241c 8b942438040000 8b490c }
            // n = 5, score = 100
            //   6a10                 | push                0x10
            //   8b5108               | mov                 edx, dword ptr [ecx + 8]
            //   8954241c             | mov                 dword ptr [esp + 0x1c], edx
            //   8b942438040000       | mov                 edx, dword ptr [esp + 0x438]
            //   8b490c               | mov                 ecx, dword ptr [ecx + 0xc]

        $sequence_5 = { 8d442414 52 50 a1???????? 8d8c2484050000 c1e006 8d942480000000 }
            // n = 7, score = 100
            //   8d442414             | lea                 eax, [esp + 0x14]
            //   52                   | push                edx
            //   50                   | push                eax
            //   a1????????           |                     
            //   8d8c2484050000       | lea                 ecx, [esp + 0x584]
            //   c1e006               | shl                 eax, 6
            //   8d942480000000       | lea                 edx, [esp + 0x80]

        $sequence_6 = { 81c430040000 c3 57 ff15???????? 8b442418 85c0 }
            // n = 6, score = 100
            //   81c430040000         | add                 esp, 0x430
            //   c3                   | ret                 
            //   57                   | push                edi
            //   ff15????????         |                     
            //   8b442418             | mov                 eax, dword ptr [esp + 0x18]
            //   85c0                 | test                eax, eax

        $sequence_7 = { 81c438040000 c3 8d8c2410010000 c784241001000028010000 }
            // n = 4, score = 100
            //   81c438040000         | add                 esp, 0x438
            //   c3                   | ret                 
            //   8d8c2410010000       | lea                 ecx, [esp + 0x110]
            //   c784241001000028010000     | mov    dword ptr [esp + 0x110], 0x128

        $sequence_8 = { 85ed f3a4 744b 8d842440020000 8d8c2444030000 }
            // n = 5, score = 100
            //   85ed                 | test                ebp, ebp
            //   f3a4                 | rep movsb           byte ptr es:[edi], byte ptr [esi]
            //   744b                 | je                  0x4d
            //   8d842440020000       | lea                 eax, [esp + 0x240]
            //   8d8c2444030000       | lea                 ecx, [esp + 0x344]

        $sequence_9 = { 81c438040000 c3 83c9ff bf???????? }
            // n = 4, score = 100
            //   81c438040000         | add                 esp, 0x438
            //   c3                   | ret                 
            //   83c9ff               | or                  ecx, 0xffffffff
            //   bf????????           |                     

    condition:
        7 of them and filesize < 114688
}
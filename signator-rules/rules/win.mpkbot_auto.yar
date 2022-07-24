rule win_mpkbot_auto {

    meta:
        author = "Felix Bilstein - yara-signator at cocacoding dot com"
        date = "2022-05-16"
        version = "1"
        description = "Detects win.mpkbot."
        info = "autogenerated rule brought to you by yara-signator"
        tool = "yara-signator v0.6.0"
        signator_config = "callsandjumps;datarefs;binvalue"
        malpedia_reference = "https://malpedia.caad.fkie.fraunhofer.de/details/win.mpkbot"
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
        $sequence_0 = { c745d803000000 0fb630 8975d4 40 }
            // n = 4, score = 400
            //   c745d803000000       | mov                 dword ptr [ebp - 0x28], 3
            //   0fb630               | movzx               esi, byte ptr [eax]
            //   8975d4               | mov                 dword ptr [ebp - 0x2c], esi
            //   40                   | inc                 eax

        $sequence_1 = { 6a03 5e 56 ff15???????? b90180ffff 663bc1 750d }
            // n = 7, score = 400
            //   6a03                 | push                3
            //   5e                   | pop                 esi
            //   56                   | push                esi
            //   ff15????????         |                     
            //   b90180ffff           | mov                 ecx, 0xffff8001
            //   663bc1               | cmp                 ax, cx
            //   750d                 | jne                 0xf

        $sequence_2 = { 50 0fb74508 50 56 ff15???????? 56 6a00 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   0fb74508             | movzx               eax, word ptr [ebp + 8]
            //   50                   | push                eax
            //   56                   | push                esi
            //   ff15????????         |                     
            //   56                   | push                esi
            //   6a00                 | push                0

        $sequence_3 = { 50 ff15???????? ff7508 a3???????? ffd0 5d c3 }
            // n = 7, score = 400
            //   50                   | push                eax
            //   ff15????????         |                     
            //   ff7508               | push                dword ptr [ebp + 8]
            //   a3????????           |                     
            //   ffd0                 | call                eax
            //   5d                   | pop                 ebp
            //   c3                   | ret                 

        $sequence_4 = { a3???????? 8d45fc 50 683f000f00 6a00 }
            // n = 5, score = 400
            //   a3????????           |                     
            //   8d45fc               | lea                 eax, [ebp - 4]
            //   50                   | push                eax
            //   683f000f00           | push                0xf003f
            //   6a00                 | push                0

        $sequence_5 = { 7fdf 5e 5b c9 }
            // n = 4, score = 400
            //   7fdf                 | jg                  0xffffffe1
            //   5e                   | pop                 esi
            //   5b                   | pop                 ebx
            //   c9                   | leave               

        $sequence_6 = { 38450c 7503 33c0 40 5d }
            // n = 5, score = 400
            //   38450c               | cmp                 byte ptr [ebp + 0xc], al
            //   7503                 | jne                 5
            //   33c0                 | xor                 eax, eax
            //   40                   | inc                 eax
            //   5d                   | pop                 ebp

        $sequence_7 = { eb15 53 ff75f8 56 ff15???????? }
            // n = 5, score = 400
            //   eb15                 | jmp                 0x17
            //   53                   | push                ebx
            //   ff75f8               | push                dword ptr [ebp - 8]
            //   56                   | push                esi
            //   ff15????????         |                     

        $sequence_8 = { c3 68???????? ff15???????? 68???????? 50 ff15???????? a3???????? }
            // n = 7, score = 400
            //   c3                   | ret                 
            //   68????????           |                     
            //   ff15????????         |                     
            //   68????????           |                     
            //   50                   | push                eax
            //   ff15????????         |                     
            //   a3????????           |                     

        $sequence_9 = { 6689500e 33d2 c70028000000 895010 895014 894818 89481c }
            // n = 7, score = 400
            //   6689500e             | mov                 word ptr [eax + 0xe], dx
            //   33d2                 | xor                 edx, edx
            //   c70028000000         | mov                 dword ptr [eax], 0x28
            //   895010               | mov                 dword ptr [eax + 0x10], edx
            //   895014               | mov                 dword ptr [eax + 0x14], edx
            //   894818               | mov                 dword ptr [eax + 0x18], ecx
            //   89481c               | mov                 dword ptr [eax + 0x1c], ecx

    condition:
        7 of them and filesize < 139264
}